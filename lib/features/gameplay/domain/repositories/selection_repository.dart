import '../entities/question.dart';
import '../entities/selection_strategy.dart';
import '../entities/player_skill_model.dart';
import '../entities/question_difficulty.dart';

abstract class SelectionRepository {
  /// Selects the next question based on the provided strategy and constraints.
  Future<Question?> selectNextQuestion({
    required SelectionStrategy strategy,
    required String sessionId,
    required PlayerSkillModel skillModel,
    List<String>? categories,
    QuestionDifficulty? fixedDifficulty,
    List<String>? excludedIds,
  });

  /// Tracks the result of a question served to a player.
  Future<void> recordQuestionResult(String playerId, String questionId, bool isCorrect, double responseTime);
  
  /// Fetches the player's skill model.
  Future<PlayerSkillModel> getPlayerSkill(String playerId);
  
  /// Saves/Updates the player's skill model.
  Future<void> updatePlayerSkill(PlayerSkillModel model);
}
