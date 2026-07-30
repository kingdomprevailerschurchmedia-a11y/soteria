import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_profile.freezed.dart';
part 'timer_profile.g.dart';

/// Configuration for the Timer Engine behavior.
@freezed
class TimerProfile with _$TimerProfile {
  const factory TimerProfile({
    required String id,
    required String name,
    required int maxDurationSeconds,
    @Default(5) int warningThresholdSeconds,
    @Default(3) int criticalThresholdSeconds,
    @Default(true) bool timeFreezeAllowed,
    @Default(true) bool pauseAllowed,
    @Default(true) bool resumeAllowed,
    @Default('expire') String timeoutBehaviour, // 'expire', 'force_submit', 'abandon'
  }) = _TimerProfile;

  factory TimerProfile.fromJson(Map<String, dynamic> json) => _$TimerProfileFromJson(json);
}
