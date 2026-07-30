import '../entities/game_session.dart';

abstract class GameSessionRepository {
  Future<void> saveCheckpoint(GameSession session);
  Future<GameSession?> loadCheckpoint();
  Future<void> clearCheckpoint();
  Future<void> logSessionEvent(String sessionId, String eventName, Map<String, dynamic> metadata);
}
