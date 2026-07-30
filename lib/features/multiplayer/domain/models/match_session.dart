import 'package:freezed_annotation/freezed_annotation.dart';
import 'player.dart';
import 'match_types.dart';

part 'match_session.freezed.dart';
part 'match_session.g.dart';

@freezed
class MatchRoom with _$MatchRoom {
  const factory MatchRoom({
    required String id,
    required MatchType type,
    required List<MatchPlayer> players,
    required MatchRoomStatus status,
    String? hostPlayerId,
    @Default({}) Map<String, dynamic> settings,
  }) = _MatchRoom;

  factory MatchRoom.fromJson(Map<String, dynamic> json) =>
      _$MatchRoomFromJson(json);
}

enum MatchRoomStatus {
  waiting,
  starting,
  active,
  finished,
  closed,
}

@freezed
class MatchSession with _$MatchSession {
  const factory MatchSession({
    required String sessionId,
    required String matchId,
    required DateTime startTime,
    required List<MatchPlayer> players,
    @Default({}) Map<String, dynamic> gameState,
  }) = _MatchSession;

  factory MatchSession.fromJson(Map<String, dynamic> json) =>
      _$MatchSessionFromJson(json);
}
