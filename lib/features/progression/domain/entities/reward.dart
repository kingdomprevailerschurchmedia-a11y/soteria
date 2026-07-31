import 'package:freezed_annotation/freezed_annotation.dart';
import 'reward_type.dart';

part 'reward.freezed.dart';
part 'reward.g.dart';

@freezed
class Reward with _$Reward {
  const factory Reward({
    required String id,
    required String title,
    required RewardType type,
    required int value,
    String? icon,
    DateTime? grantedAt,
  }) = _Reward;

  factory Reward.fromJson(Map<String, dynamic> json) => _$RewardFromJson(json);
}

@freezed
class Achievement with _$Achievement {
  const factory Achievement({
    required String id,
    required String title,
    required String description,
    required String icon,
    @Default(false) bool isUnlocked,
    DateTime? unlockedAt,
    @Default(0) int xpReward,
  }) = _Achievement;

  factory Achievement.fromJson(Map<String, dynamic> json) => _$AchievementFromJson(json);
}
