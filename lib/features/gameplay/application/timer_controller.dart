import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/entities/timer_state.dart';
import '../domain/entities/timer_status.dart';
import '../domain/entities/timer_profile.dart';

part 'timer_controller.g.dart';

@riverpod
class TimerController extends _$TimerController {
  Timer? _ticker;

  @override
  TimerState? build() {
    ref.onDispose(() => _ticker?.cancel());
    return null;
  }

  void initialize(String sessionId, TimerProfile profile) {
    state = TimerState(
      sessionId: sessionId,
      profile: profile,
      remainingSeconds: profile.maxDurationSeconds,
      status: TimerStatus.preparing,
    );
  }

  void start() {
    if (state == null) return;
    
    state = state!.copyWith(
      status: TimerStatus.running,
      startTime: DateTime.now(),
      lastTickTime: DateTime.now(),
    );

    _startTicker();
  }

  void pause() {
    if (state == null || !state!.status.isRunning) return;
    
    _ticker?.cancel();
    state = state!.copyWith(status: TimerStatus.paused);
  }

  void resume() {
    if (state == null || state!.status != TimerStatus.paused) return;
    
    state = state!.copyWith(
      status: TimerStatus.running,
      lastTickTime: DateTime.now(),
    );
    _startTicker();
  }

  void freeze(int durationSeconds) {
    if (state == null || state!.isFrozen) return;

    _ticker?.cancel();
    state = state!.copyWith(
      status: TimerStatus.frozen,
      isFrozen: true,
      freezeUntil: DateTime.now().add(Duration(seconds: durationSeconds)),
    );

    Timer(Duration(seconds: durationSeconds), () {
      if (state?.status == TimerStatus.frozen) {
        resume();
        state = state?.copyWith(isFrozen: false, freezeUntil: null);
      }
    });
  }

  void reset() {
    _ticker?.cancel();
    if (state != null) {
      state = state!.copyWith(
        remainingSeconds: state!.profile.maxDurationSeconds,
        elapsedSeconds: 0,
        status: TimerStatus.idle,
        isFrozen: false,
      );
    }
  }

  void stop() {
    _ticker?.cancel();
    state = state?.copyWith(status: TimerStatus.completed);
  }

  void recover(TimerState recoveredState) {
    state = recoveredState.copyWith(status: TimerStatus.paused);
  }

  void _startTicker() {
    _ticker?.cancel();
    _ticker = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state == null) {
        timer.cancel();
        return;
      }

      if (state!.remainingSeconds > 0) {
        final newRemaining = state!.remainingSeconds - 1;
        final newElapsed = state!.elapsedSeconds + 1;
        
        TimerStatus newStatus = TimerStatus.running;
        if (newRemaining <= state!.profile.criticalThresholdSeconds) {
          newStatus = TimerStatus.critical;
        } else if (newRemaining <= state!.profile.warningThresholdSeconds) {
          newStatus = TimerStatus.warning;
        }

        state = state!.copyWith(
          remainingSeconds: newRemaining,
          elapsedSeconds: newElapsed,
          status: newStatus,
          lastTickTime: DateTime.now(),
        );
      } else {
        state = state!.copyWith(status: TimerStatus.expired);
        timer.cancel();
        _handleTimeout();
      }
    });
  }

  void _handleTimeout() {
    ref.read(gameSessionControllerProvider.notifier).endMatch();
  }
}
