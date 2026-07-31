import 'package:freezed_annotation/freezed_annotation.dart';

part 'progression_profile.freezed.dart';
part 'progression_profile.g.dart';

@freezed
class ProgressionProfile with _$ProgressionProfile {
  const factory ProgressionProfile({
    required String id,
    required String name,
    @Default(10) int baseQuestionScore,
    @Default(50) int baseMatchXP,
    @Default(100) int levelUpBaseXP,
    @Default(1.2) double levelMultiplier,
    @Default(5) int speedBonusThresholdSeconds,
    @Default(10) int speedBonusPoints,
    @Default(20) int perfectRoundBonusPoints,
  }) = _ProgressionProfile;

  factory ProgressionProfile.fromJson(Map<String, dynamic> json) => _$ProgressionProfileFromJson(json);
}
