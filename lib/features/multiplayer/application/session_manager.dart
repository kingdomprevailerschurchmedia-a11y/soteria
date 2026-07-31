import 'dart:async';
import '../domain/models/session_models.dart';
import '../domain/services/session_sync_service.dart';
import '../../game_rules/application/game_rules_engine.dart';
import '../../game_rules/domain/models/game_mode.dart';

class SessionManager {
  final SessionSyncService _syncService;
  final GameRulesEngine _rulesEngine;

  SessionManager({
    required SessionSyncService syncService,
    required GameRulesEngine rulesEngine,
  })  : _syncService = syncService,
        _rulesEngine = rulesEngine;

  Future<void> initializeSession(String sessionId) async {
    await _syncService.joinSession(sessionId);
  }

  Future<void> markAsReady(String sessionId, String playerId) async {
    await _syncService.setReady(sessionId, playerId, true);
  }

  Future<void> submitPlayerAnswer(String sessionId, PlayerAnswer answer) async {
    await _syncService.submitAnswer(sessionId, answer);
  }

  Future<void> leave(String sessionId) async {
    await _syncService.leaveSession(sessionId);
  }

  Stream<GameSession> sessionStream(String sessionId) => 
      _syncService.watchSession(sessionId);

  Stream<SessionEvent> eventStream(String sessionId) => 
      _syncService.watchEvents(sessionId);
      
  /// Checks if the session should start based on Game Rules
  Future<bool> canStartSession(GameSession session, GameMode mode) async {
    final rules = await _rulesEngine.getActiveRules(mode);
    // Logic to check if enough players are ready, etc.
    // This is typically handled by the server in a real implementation.
    return session.players.every((p) => p.isReady);
  }
}
