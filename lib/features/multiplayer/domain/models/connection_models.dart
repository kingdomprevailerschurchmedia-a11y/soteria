import 'package:freezed_annotation/freezed_annotation.dart';

part 'connection_models.freezed.dart';
part 'connection_models.g.dart';

enum ConnectionState {
  disconnected,
  connecting,
  connected,
  reconnecting,
  failed,
}

@freezed
class MatchInvitation with _$MatchInvitation {
  const factory MatchInvitation({
    required String id,
    required String senderId,
    required String senderName,
    required String receiverId,
    required String roomId,
    required DateTime createdAt,
    @Default(InvitationStatus.pending) InvitationStatus status,
  }) = _MatchInvitation;

  factory MatchInvitation.fromJson(Map<String, dynamic> json) =>
      _$MatchInvitationFromJson(json);
}

enum InvitationStatus {
  pending,
  accepted,
  declined,
  expired,
}
