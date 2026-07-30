import 'dart:math';
import '../../domain/entities/assist_type.dart';
import '../../domain/entities/assist_usage.dart';
import '../../domain/entities/assist_status.dart';
import '../../domain/repositories/assist_repository.dart';
import '../../domain/repositories/question_repository.dart';

class MockAssistRepository implements AssistRepository {
  final QuestionRepository _questionRepository;
  final Map<String, List<AssistUsage>> _sessionAssists = {};

  MockAssistRepository(this._questionRepository);

  @override
  Future<bool> validateAssist(String sessionId, String questionId, AssistType type) async {
    final assists = _sessionAssists[sessionId] ?? await resetAssists(sessionId);
    final assist = assists.firstWhere((a) => a.type == type);
    return assist.status == AssistStatus.available;
  }

  @override
  Future<AssistUsage> useAssist(String sessionId, String questionId, AssistType type) async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    
    final assists = _sessionAssists[sessionId] ?? [];
    final index = assists.indexWhere((a) => a.type == type);
    
    if (index == -1 || assists[index].status != AssistStatus.available) {
      throw Exception('Assist not available');
    }

    Map<String, dynamic> metadata = {};

    if (type == AssistType.eliminateTwo) {
      final question = await _questionRepository.getQuestionById(questionId);
      if (question != null) {
        final incorrectOptions = question.options.where((o) => !o.isCorrect).toList();
        incorrectOptions.shuffle();
        final removedIds = incorrectOptions.take(2).map((o) => o.id).toList();
        metadata['removedOptionIds'] = removedIds;
      }
    } else if (type == AssistType.timeFreeze) {
      metadata['durationSeconds'] = 15;
    } else if (type == AssistType.communityInsight) {
      final insight = await getCommunityInsight(questionId);
      metadata['insight'] = insight.toJson();
    }

    final updatedAssist = assists[index].copyWith(
      status: AssistStatus.used,
      usedAt: DateTime.now(),
      questionId: questionId,
      metadata: metadata,
    );

    _sessionAssists[sessionId]![index] = updatedAssist;
    return updatedAssist;
  }

  @override
  Future<CommunityInsightResult> getCommunityInsight(String questionId) async {
    final question = await _questionRepository.getQuestionById(questionId);
    if (question == null) throw Exception('Question not found');

    final random = Random();
    final Map<String, double> stats = {};
    
    // Simulate some historical data distribution
    double total = 0;
    final options = question.options;
    final double correctWeight = 0.6 + random.nextDouble() * 0.2; // 60-80% usually pick correct
    
    for (var option in options) {
      if (option.isCorrect) {
        stats[option.id] = correctWeight;
      } else {
        stats[option.id] = (1.0 - correctWeight) / (options.length - 1);
      }
    }

    return CommunityInsightResult(
      statistics: stats,
      isSimulated: true,
    );
  }

  @override
  Future<List<AssistUsage>> resetAssists(String sessionId) async {
    final initialAssists = [
      AssistUsage(id: 'a1', type: AssistType.eliminateTwo),
      AssistUsage(id: 'a2', type: AssistType.timeFreeze),
      AssistUsage(id: 'a3', type: AssistType.communityInsight),
    ];
    _sessionAssists[sessionId] = initialAssists;
    return initialAssists;
  }
}
