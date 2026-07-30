import '../models/matchmaking.dart';
import '../models/match_session.dart';
import '../models/player.dart';
import '../models/player_status.dart';
import '../models/connection_models.dart';

abstract class MatchmakingService {
  Future<MatchmakingTicket> requestMatch(MatchmakingRequest request);
  Future<void> cancelMatchmaking(String ticketId);
  Stream<MatchmakingTicket> watchTicket(String ticketId);
  Future<int> getEstimatedWaitTime(MatchmakingRequest request);
}

abstract class MatchService {
  Future<MatchRoom> joinRoom(String roomId);
  Future<void> leaveRoom(String roomId);
  Future<void> setReady(String roomId, bool ready);
  Stream<MatchRoom> watchRoom(String roomId);
  Future<void> updateMatchState(String matchId, Map<String, dynamic> state);
}

abstract class PresenceService {
  Future<void> updateStatus(PlayerStatus status);
  Stream<List<Player>> watchOnlinePlayers();
  Stream<PlayerStatus> watchPlayerStatus(String playerId);
}

abstract class InvitationService {
  Future<void> sendInvitation(String receiverId, String roomId);
  Future<void> respondToInvitation(String invitationId, InvitationStatus response);
  Stream<List<MatchInvitation>> watchInvitations();
}
