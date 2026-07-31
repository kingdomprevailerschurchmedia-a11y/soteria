import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/entities/question.dart';
import '../domain/entities/selection_strategy.dart';
import '../domain/entities/player_skill_model.dart';
import '../presentation/providers/gameplay_providers.dart';
import 'difficulty_engine.dart';
import 'player_skill_estimator.dart';

part 'question_selection_engine.g.dart';

@riverpod
class QuestionSelectionEngine extends _$QuestionSelectionEngine {
  @override
  void build() {}

  Future<Question?> nextQuestion({
    required String sessionId,
    required SelectionStrategy strategy,
    List<String>? categories,
    List<String>? excludedIds,
  }) async {
    final selectionRepo = ref.read(selectionRepositoryProvider);
    
    // 1. Get current skill model
    // In a real app, we'd use the current authenticated user's ID
    final skillModel = await selectionRepo.getPlayerSkill('current_user');

    // 2. Select next question based on strategy
    return await selectionRepo.selectNextQuestion(
      sessionId: sessionId,
      strategy: strategy,
      skillModel: skillModel,
      categories: categories,
      excludedIds: excludedIds,
    );
  }

  Future<void> processResult({
    required String questionId,
    required bool isCorrect,
    required double responseTimeSeconds,
    required Question currentQuestion,
  }) async {
    final selectionRepo = ref.read(selectionRepositoryProvider);
    final skillModel = await selectionRepo.getPlayerSkill('current_user');

    // 1. Update skill model
    final updatedSkill = PlayerSkillEstimator.updateEstimate(
      skillModel, 
      isCorrect, 
      responseTimeSeconds, 
      currentQuestion.difficulty,
    );

    // 2. Adjust suggested difficulty if in adaptive mode
    final nextDifficulty = DifficultyEngine.calculateNext(updatedSkill, isCorrect, responseTimeSeconds);
    
    await selectionRepo.updatePlayerSkill(updatedSkill.copyWith(estimatedDifficulty: nextDifficulty));
    
    // 3. Record result for history
    await selectionRepo.recordQuestionResult('current_user', questionId, isCorrect, responseTimeSeconds);
  }
}
