import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/game_session.dart';
import '../../domain/repositories/game_session_repository.dart';
import '../../../../core/logging/logger.dart';

class MockGameSessionRepository implements GameSessionRepository {
  MockGameSessionRepository(this._prefs, this._logger);
  
  final SharedPreferences _prefs;
  final SoteriaLogger _logger;
  static const _checkpointKey = 'game_session_checkpoint';

  @override
  Future<void> saveCheckpoint(GameSession session) async {
    final jsonString = jsonEncode(session.toJson());
    await _prefs.setString(_checkpointKey, jsonString);
    _logger.info('Checkpoint saved for session: ${session.id}');
  }

  @override
  Future<GameSession?> loadCheckpoint() async {
    final jsonString = _prefs.getString(_checkpointKey);
    if (jsonString == null) return null;
    try {
      return GameSession.fromJson(jsonDecode(jsonString) as Map<String, dynamic>);
    } catch (e) {
      _logger.error('Failed to load checkpoint: $e');
      return null;
    }
  }

  @override
  Future<void> clearCheckpoint() async {
    await _prefs.remove(_checkpointKey);
  }

  @override
  Future<void> logSessionEvent(String sessionId, String eventName, Map<String, dynamic> metadata) async {
    _logger.info('Analytics Event: $eventName (Session: $sessionId) - $metadata');
  }
}
