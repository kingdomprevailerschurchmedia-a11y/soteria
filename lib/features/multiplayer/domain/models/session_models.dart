import 'package:freezed_annotation/freezed_annotation.dart';
import 'player.dart';
import 'match_types.dart';
import 'connection_models.dart';

part 'session_models.freezed.dart';
part 'session_models.g.dart';

enum SessionStatus {
  created,
  waitingForPlayers,
  readyCheck,
  countdown,
  inProgress,
  roundTransition,
  finished,
  closed,
  cancelled,
}

@freezed
class GameSession with _$GameSession {
  const factory GameSession({
    required String sessionId,
    required String matchId,
    required MatchType type,
    required SessionStatus status,
    required List<PlayerState> players,
    required DateTime createdAt,
    DateTime? startedAt,
    DateTime? finishedAt,
    @Default(0) int currentRound,
    @Default(0) int totalRounds,
    @Default({}) Map<String, dynamic> metadata,
  }) = _GameSession;

  factory GameSession.fromJson(Map<String, dynamic> json) =>
      _$GameSessionFromJson(json);
}

@freezed
class PlayerState with _$PlayerState {
  const factory PlayerState({
    required String playerId,
    required String displayName,
    @Default(false) bool isReady,
    @Default(false) bool isConnected,
    @Default(0) int score,
    @Default([]) List<PlayerAnswer> answers,
    @Default(0) int latencyMs,
    String? lastKnownStatus,
  }) = _PlayerState;

  factory PlayerState.fromJson(Map<String, dynamic> json) =>
      _$PlayerStateFromJson(json);
}

@freezed
class PlayerAnswer with _$PlayerAnswer {
  const factory PlayerAnswer({
    required int roundIndex,
    required String questionId,
    required String selectedOptionId,
    required bool isCorrect,
    required int responseTimeMs,
    required DateTime timestamp,
  }) = _PlayerAnswer;

  factory PlayerAnswer.fromJson(Map<String, dynamic> json) =>
      _$PlayerAnswerFromJson(json);
}

@freezed
class SessionEvent with _$SessionEvent {
  const factory SessionEvent({
    required String id,
    required String sessionId,
    required SessionEventType type,
    required Map<String, dynamic> data,
    required DateTime timestamp,
  }) = _SessionEvent;

  factory SessionEvent.fromJson(Map<String, dynamic> json) =>
      _$SessionEventFromJson(json);
}

enum SessionEventType {
  playerJoined,
  playerLeft,
  playerReady,
  countdownStarted,
  gameStarted,
  roundStarted,
  answerSubmitted,
  roundEnded,
  gameEnded,
  playerDisconnected,
  playerReconnected,
}

@freezed
class SessionResult with _$SessionResult {
  const factory SessionResult({
    required String sessionId,
    required List<PlayerScore> finalScores,
    required DateTime finishedAt,
    required Duration totalDuration,
  }) = _SessionResult;

  factory SessionResult.fromJson(Map<String, dynamic> json) =>
      _$SessionResultFromJson(json);
}

@freezed
class PlayerScore with _$PlayerScore {
  const factory PlayerScore({
    required String playerId,
    required int score,
    required int rank,
    required int totalCorrect,
    required int averageResponseTimeMs,
  }) = _PlayerScore;

  factory PlayerScore.fromJson(Map<String, dynamic> json) =>
      _$PlayerScoreFromJson(json);
}
