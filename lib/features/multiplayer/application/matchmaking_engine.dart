import 'dart:async';
import '../domain/models/matchmaking.dart';
import '../domain/models/match_types.dart';
import '../domain/services/multiplayer_services.dart';

class MatchmakingEngine {
  final MatchmakingService _service;
  
  MatchmakingEngine(this._service);

  Future<MatchmakingTicket> findMatch({
    required String playerId,
    required MatchType type,
    MatchmakingMode mode = MatchmakingMode.random,
    Map<String, dynamic> criteria = const {},
  }) async {
    final request = MatchmakingRequest(
      playerId: playerId,
      matchType: type,
      mode: mode,
      criteria: criteria,
    );
    
    return await _service.requestMatch(request);
  }

  Future<void> cancelSearch(String ticketId) async {
    await _service.cancelMatchmaking(ticketId);
  }

  Stream<MatchmakingTicket> trackTicket(String ticketId) {
    return _service.watchTicket(ticketId);
  }
}
