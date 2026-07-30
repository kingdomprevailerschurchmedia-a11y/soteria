import 'package:freezed_annotation/freezed_annotation.dart';

part 'difficulty_rules.freezed.dart';
part 'difficulty_rules.g.dart';

@freezed
class DifficultyRules with _$DifficultyRules {
  const factory DifficultyRules({
    required String initialDifficulty,
    required bool adaptiveProgression,
    required double scalingFactor,
    required int maxDifficultyLevel,
  }) = _DifficultyRules;

  factory DifficultyRules.fromJson(Map<String, dynamic> json) =>
      _$DifficultyRulesFromJson(json);
}
