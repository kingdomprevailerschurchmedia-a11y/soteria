import '../models/session_models.dart';

abstract class SessionSyncService {
  /// Watches the state of a specific game session.
  Stream<GameSession> watchSession(String sessionId);

  /// Watches events occurring within a session.
  Stream<SessionEvent> watchEvents(String sessionId);

  /// Updates the player's readiness status.
  Future<void> setReady(String sessionId, String playerId, bool ready);

  /// Submits an answer for the current round.
  Future<void> submitAnswer(String sessionId, PlayerAnswer answer);

  /// Sends a custom event to the session.
  Future<void> sendEvent(String sessionId, SessionEventType type, Map<String, dynamic> data);

  /// Attempts to join a session.
  Future<void> joinSession(String sessionId);

  /// Leaves a session.
  Future<void> leaveSession(String sessionId);
  
  /// Requests a full state synchronization.
  Future<GameSession> syncState(String sessionId);
}

abstract class LatencyService {
  /// Measures current latency to the session backend.
  Future<int> measureLatency();
  
  /// Watches for changes in connection quality.
  Stream<int> watchLatency();
}
