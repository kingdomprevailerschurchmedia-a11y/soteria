import 'package:freezed_annotation/freezed_annotation.dart';
import 'timer_status.dart';
import 'timer_profile.dart';

part 'timer_state.freezed.dart';
part 'timer_state.g.dart';

@freezed
class TimerState with _$TimerState {
  const factory TimerState({
    required String sessionId,
    required TimerProfile profile,
    @Default(TimerStatus.idle) TimerStatus status,
    @Default(0) int remainingSeconds,
    @Default(0) int elapsedSeconds,
    DateTime? startTime,
    DateTime? lastTickTime,
    @Default(false) bool isFrozen,
    DateTime? freezeUntil,
  }) = _TimerState;

  const TimerState._();

  factory TimerState.fromJson(Map<String, dynamic> json) => _$TimerStateFromJson(json);

  double get progress => profile.maxDurationSeconds == 0 
      ? 0 
      : remainingSeconds / profile.maxDurationSeconds;
  
  bool get isWarning => remainingSeconds <= profile.warningThresholdSeconds && remainingSeconds > profile.criticalThresholdSeconds;
  bool get isCritical => remainingSeconds <= profile.criticalThresholdSeconds && remainingSeconds > 0;
}
