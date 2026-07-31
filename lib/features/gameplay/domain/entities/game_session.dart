import 'package:freezed_annotation/freezed_annotation.dart';
import 'game_session_status.dart';
import 'question_session.dart';
import 'assist_usage.dart';
import 'timer_profile.dart';
import 'timer_state.dart';

part 'game_session.freezed.dart';
part 'game_session.g.dart';

@freezed
class GameSession with _$GameSession {
  const factory GameSession({
    required String id,
    required String mode, // practice, pro, versus, etc.
    @Default(GameSessionStatus.idle) GameSessionStatus status,
    QuestionSession? questionSession,
    @Default([]) List<AssistUsage> assistUsage,
    @Default(0) int currentScore,
    @Default(0) int elapsedTimeSeconds,
    @Default(0) int totalTimeLimitSeconds,
    TimerProfile? timerProfile,
    TimerState? timerState,
    DateTime? startTime,
    DateTime? lastCheckpointTime,
    Map<String, dynamic>? metadata,
  }) = _GameSession;

  const GameSession._();

  factory GameSession.fromJson(Map<String, dynamic> json) => _$GameSessionFromJson(json);

  bool get isRecoverable => 
      status == GameSessionStatus.interrupted || 
      status == GameSessionStatus.paused ||
      status == GameSessionStatus.active;
}
