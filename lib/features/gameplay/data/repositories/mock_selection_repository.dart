import 'dart:math';
import '../../domain/entities/question.dart';
import '../../domain/entities/selection_strategy.dart';
import '../../domain/entities/player_skill_model.dart';
import '../../domain/entities/question_difficulty.dart';
import '../../domain/repositories/selection_repository.dart';
import '../../domain/repositories/question_repository.dart';

class MockSelectionRepository implements SelectionRepository {
  final QuestionRepository _questionRepository;
  final Map<String, PlayerSkillModel> _skillCache = {};

  MockSelectionRepository(this._questionRepository);

  @override
  Future<Question?> selectNextQuestion({
    required SelectionStrategy strategy,
    required String sessionId,
    required PlayerSkillModel skillModel,
    List<String>? categories,
    QuestionDifficulty? fixedDifficulty,
    List<String>? excludedIds,
  }) async {
    // 1. Fetch available questions based on basic filters
    final questions = await _questionRepository.getQuestions(
      categories: categories,
      difficulty: fixedDifficulty ?? (strategy == SelectionStrategy.adaptive ? skillModel.estimatedDifficulty : null),
    );

    // 2. Filter out excluded IDs
    final pool = questions.where((q) => !(excludedIds?.contains(q.id) ?? false)).toList();
    if (pool.isEmpty) return null;

    // 3. Apply selection logic
    if (strategy == SelectionStrategy.deterministic || strategy == SelectionStrategy.linear) {
      return pool.first;
    }

    // Default to random from pool for mock
    return pool[Random().nextInt(pool.length)];
  }

  @override
  Future<void> recordQuestionResult(String playerId, String questionId, bool isCorrect, double responseTime) async {
    // Analytics/History logging logic
  }

  @override
  Future<PlayerSkillModel> getPlayerSkill(String playerId) async {
    return _skillCache[playerId] ?? PlayerSkillModel(playerId: playerId);
  }

  @override
  Future<void> updatePlayerSkill(PlayerSkillModel model) async {
    _skillCache[model.playerId] = model;
  }
}
