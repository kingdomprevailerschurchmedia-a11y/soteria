import 'package:freezed_annotation/freezed_annotation.dart';

part 'reward_rules.freezed.dart';
part 'reward_rules.g.dart';

@freezed
class RewardRules with _$RewardRules {
  const factory RewardRules({
    required int baseXP,
    required int baseCoins,
    required int baseReputation,
    required double streakMultiplier,
    required int maxStreakBonus,
    @Default(1.0) double seasonalMultiplier,
    @Default(false) bool doubleXPActive,
  }) = _RewardRules;

  factory RewardRules.fromJson(Map<String, dynamic> json) =>
      _$RewardRulesFromJson(json);
}
