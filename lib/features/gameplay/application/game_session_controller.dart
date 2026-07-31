import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/entities/game_session.dart';
import '../domain/entities/game_session_status.dart';
import '../domain/entities/question_difficulty.dart';
import '../presentation/providers/gameplay_providers.dart';
import 'question_controller.dart';
import 'assist_controller.dart';
import 'countdown_controller.dart';
import 'timer_controller.dart';
import '../domain/entities/timer_profile.dart';

part 'game_session_controller.g.dart';

@riverpod
class GameSessionController extends _$GameSessionController {
  @override
  GameSession? build() => null;

  Future<void> startMatch({
    required String mode,
    int questionLimit = 10,
    QuestionDifficulty? difficulty,
    TimerProfile? timerProfile,
  }) async {
    state = GameSession(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      mode: mode,
      status: GameSessionStatus.initializing,
      timerProfile: timerProfile,
    );

    _logEvent('Session Started', {'mode': mode, 'questions': questionLimit});

    // 1. Initialize Questions
    await ref.read(questionControllerProvider.notifier).startSession(
      limit: questionLimit,
      difficulty: difficulty,
    );

    final questionState = ref.read(questionControllerProvider);
    if (questionState.errorMessage != null) {
      state = state?.copyWith(status: GameSessionStatus.idle);
      return;
    }

    // 2. Initialize Timer if profile provided
    if (timerProfile != null) {
      ref.read(timerControllerProvider.notifier).initialize(state!.id, timerProfile);
    }

    // 3. Start Countdown
    state = state?.copyWith(
      status: GameSessionStatus.countdown,
      questionSession: questionState.session,
    );

    ref.read(countdownControllerProvider.notifier).start(3, () {
      _activateMatch();
    });
  }

  void _activateMatch() {
    state = state?.copyWith(
      status: GameSessionStatus.active,
      startTime: DateTime.now(),
    );

    if (state?.timerProfile != null) {
      ref.read(timerControllerProvider.notifier).start();
    }

    _saveCheckpoint();
  }

  void pauseMatch() {
    if (state?.status != GameSessionStatus.active) return;
    state = state?.copyWith(status: GameSessionStatus.paused);
    
    ref.read(timerControllerProvider.notifier).pause();
    
    _logEvent('Session Paused', {});
    _saveCheckpoint();
  }

  void resumeMatch() {
    if (state?.status != GameSessionStatus.paused) return;
    state = state?.copyWith(status: GameSessionStatus.active);
    
    ref.read(timerControllerProvider.notifier).resume();
    
    _logEvent('Session Resumed', {});
  }

  void endMatch() {
    ref.read(timerControllerProvider.notifier).stop();
    final questionSession = ref.read(questionControllerProvider).session;
    state = state?.copyWith(
      status: GameSessionStatus.completed,
      questionSession: questionSession,
    );
    _logEvent('Session Completed', {'score': state?.currentScore});
    ref.read(gameSessionRepositoryProvider).clearCheckpoint();
  }

  void abandonMatch() {
    _logEvent('Session Abandoned', {});
    state = state?.copyWith(status: GameSessionStatus.abandoned);
    ref.read(gameSessionRepositoryProvider).clearCheckpoint();
    reset();
  }

  Future<void> recoverSession() async {
    final checkpoint = await ref.read(gameSessionRepositoryProvider).loadCheckpoint();
    if (checkpoint != null && checkpoint.isRecoverable) {
      state = checkpoint.copyWith(status: GameSessionStatus.paused);
      _logEvent('Session Recovered', {'sessionId': checkpoint.id});
      
      // Sync child controllers
      if (checkpoint.questionSession != null) {
        ref.read(questionControllerProvider.notifier).restoreSession(checkpoint.questionSession!);
      }
      if (checkpoint.timerState != null) {
        ref.read(timerControllerProvider.notifier).recover(checkpoint.timerState!);
      }
      if (checkpoint.assistUsage.isNotEmpty) {
        ref.read(assistControllerProvider.notifier).restoreAssists(checkpoint.assistUsage);
      }
    }
  }

  void updateScore(int points) {
    state = state?.copyWith(currentScore: (state?.currentScore ?? 0) + points);
    _saveCheckpoint();
  }

  void reset() {
    state = null;
    ref.read(questionControllerProvider.notifier).resetSession();
  }

  void _saveCheckpoint() {
    if (state != null) {
      final questionSession = ref.read(questionControllerProvider).session;
      final assistState = ref.read(assistControllerProvider);
      final timerState = ref.read(timerControllerProvider);
      
      final updatedState = state!.copyWith(
        questionSession: questionSession,
        assistUsage: assistState.currentAssists,
        timerState: timerState,
        lastCheckpointTime: DateTime.now(),
      );
      
      ref.read(gameSessionRepositoryProvider).saveCheckpoint(updatedState);
    }
  }

  void _logEvent(String name, Map<String, dynamic> metadata) {
    if (state != null) {
      ref.read(gameSessionRepositoryProvider).logSessionEvent(state!.id, name, metadata);
    }
  }
}
