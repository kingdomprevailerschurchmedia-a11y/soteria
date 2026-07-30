import '../domain/entities/question_difficulty.dart';
import '../domain/entities/player_skill_model.dart';

class DifficultyEngine {
  /// Calculates the next suggested difficulty based on performance.
  static QuestionDifficulty calculateNext(
    PlayerSkillModel currentSkill, 
    bool lastWasCorrect,
    double responseTimeSeconds,
  ) {
    // Basic adaptive logic: 
    // - Two correct in a row -> Increase difficulty
    // - One incorrect -> Stay or decrease
    
    final current = currentSkill.estimatedDifficulty;
    
    if (lastWasCorrect && responseTimeSeconds < 10) {
      return _increase(current);
    } else if (!lastWasCorrect) {
      return _decrease(current);
    }
    
    return current;
  }

  static QuestionDifficulty _increase(QuestionDifficulty current) {
    switch (current) {
      case QuestionDifficulty.beginner: return QuestionDifficulty.intermediate;
      case QuestionDifficulty.intermediate: return QuestionDifficulty.advanced;
      case QuestionDifficulty.advanced: return QuestionDifficulty.elite;
      case QuestionDifficulty.elite: return QuestionDifficulty.elite;
    }
  }

  static QuestionDifficulty _decrease(QuestionDifficulty current) {
    switch (current) {
      case QuestionDifficulty.elite: return QuestionDifficulty.advanced;
      case QuestionDifficulty.advanced: return QuestionDifficulty.intermediate;
      case QuestionDifficulty.intermediate: return QuestionDifficulty.beginner;
      case QuestionDifficulty.beginner: return QuestionDifficulty.beginner;
    }
  }
}
