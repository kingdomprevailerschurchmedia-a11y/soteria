import 'package:freezed_annotation/freezed_annotation.dart';

part 'guest_progress.freezed.dart';
part 'guest_progress.g.dart';

/// Represents local user progress for guest users.
@freezed
abstract class GuestProgress with _$GuestProgress {
  const factory GuestProgress({
    @Default(0) int xp,
    @Default(0) int coins,
    @Default([]) List<String> completedQuizIds,
    @Default([]) List<String> unlockedAchievements,
    @Default({}) Map<String, dynamic> localSettings,
  }) = _GuestProgress;

  factory GuestProgress.fromJson(Map<String, dynamic> json) =>
      _$GuestProgressFromJson(json);
}
