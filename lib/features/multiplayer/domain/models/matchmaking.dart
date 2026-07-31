import 'package:freezed_annotation/freezed_annotation.dart';
import 'match_types.dart';

part 'matchmaking.freezed.dart';
part 'matchmaking.g.dart';

@freezed
class MatchmakingRequest with _$MatchmakingRequest {
  const factory MatchmakingRequest({
    required String playerId,
    required MatchType matchType,
    required MatchmakingMode mode,
    @Default({}) Map<String, dynamic> criteria,
  }) = _MatchmakingRequest;

  factory MatchmakingRequest.fromJson(Map<String, dynamic> json) =>
      _$MatchmakingRequestFromJson(json);
}

@freezed
class MatchmakingTicket with _$MatchmakingTicket {
  const factory MatchmakingTicket({
    required String ticketId,
    required String playerId,
    required DateTime createdAt,
    required MatchmakingStatus status,
    String? matchId,
    @Default(0) int estimatedWaitSeconds,
  }) = _MatchmakingTicket;

  factory MatchmakingTicket.fromJson(Map<String, dynamic> json) =>
      _$MatchmakingTicketFromJson(json);
}

enum MatchmakingStatus {
  queued,
  searching,
  matching,
  completed,
  cancelled,
  timedOut,
  failed,
}

@freezed
class QueueState with _$QueueState {
  const factory QueueState({
    required bool isQueued,
    MatchmakingTicket? ticket,
    @Default(0) int timeInQueueSeconds,
    @Default(0) int playersInQueue,
  }) = _QueueState;
}
