import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_stats.freezed.dart';
part 'user_stats.g.dart';

@freezed
abstract class UserStats with _$UserStats {
  const factory UserStats({
    required int level,
    required double xpProgress,
    required int coins,
    required int streakDays,
    required int lives,
    required String rank,
  }) = _UserStats;

  factory UserStats.fromJson(Map<String, dynamic> json) =>
      _$UserStatsFromJson(json);
}
