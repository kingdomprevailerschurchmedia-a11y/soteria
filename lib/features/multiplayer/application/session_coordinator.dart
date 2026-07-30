import '../domain/models/session_models.dart';
import '../domain/services/session_sync_service.dart';

class SessionCoordinator {
  final SessionSyncService _syncService;

  SessionCoordinator(this._syncService);

  Future<void> handleReadyCheck(String sessionId, String playerId) async {
    await _syncService.setReady(sessionId, playerId, true);
  }

  Future<void> syncNextRound(String sessionId, int nextRound) async {
    await _syncService.sendEvent(
      sessionId, 
      SessionEventType.roundStarted, 
      {'round': nextRound},
    );
  }

  void validateSessionState(GameSession session) {
    // Perform integrity checks on the session state
    if (session.status == SessionStatus.inProgress && session.players.isEmpty) {
      // Handle edge case
    }
  }
}
