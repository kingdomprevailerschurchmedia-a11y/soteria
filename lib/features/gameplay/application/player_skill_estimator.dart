import '../domain/entities/player_skill_model.dart';
import '../domain/entities/question_difficulty.dart';

class PlayerSkillEstimator {
  static PlayerSkillModel updateEstimate(
    PlayerSkillModel current,
    bool lastWasCorrect,
    double responseTimeSeconds,
    QuestionDifficulty questionDifficulty,
  ) {
    final total = current.totalQuestionsAnswered + 1;
    final newAccuracy = ((current.overallAccuracy * current.totalQuestionsAnswered) + (lastWasCorrect ? 1 : 0)) / total;
    
    final newAvgTime = ((current.averageResponseTimeSeconds * current.totalQuestionsAnswered) + responseTimeSeconds) / total;

    // Simple Knowledge Rating adjustment
    int ratingDelta = lastWasCorrect ? 15 : -10;
    if (questionDifficulty == QuestionDifficulty.elite && lastWasCorrect) ratingDelta = 30;

    return current.copyWith(
      totalQuestionsAnswered: total,
      overallAccuracy: newAccuracy,
      averageResponseTimeSeconds: newAvgTime,
      knowledgeRating: current.knowledgeRating + ratingDelta,
    );
  }
}
