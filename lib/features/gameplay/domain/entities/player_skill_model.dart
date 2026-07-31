import 'package:freezed_annotation/freezed_annotation.dart';
import 'question_difficulty.dart';

part 'player_skill_model.freezed.dart';
part 'player_skill_model.g.dart';

@freezed
class PlayerSkillModel with _$PlayerSkillModel {
  const factory PlayerSkillModel({
    required String playerId,
    @Default(0.5) double overallAccuracy,
    @Default(QuestionDifficulty.beginner) QuestionDifficulty estimatedDifficulty,
    @Default({}) Map<String, double> categoryStrengths, // categoryId -> strength (0.0 to 1.0)
    @Default(0) int totalQuestionsAnswered,
    @Default(0.0) double averageResponseTimeSeconds,
    @Default(1000) int knowledgeRating, // Elo-like rating
  }) = _PlayerSkillModel;

  factory PlayerSkillModel.fromJson(Map<String, dynamic> json) => _$PlayerSkillModelFromJson(json);
}
