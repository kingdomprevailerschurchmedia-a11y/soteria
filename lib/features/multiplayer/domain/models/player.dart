import 'package:freezed_annotation/freezed_annotation.dart';
import 'player_status.dart';

part 'player.freezed.dart';
part 'player.g.dart';

@freezed
class Player with _$Player {
  const factory Player({
    required String id,
    required String displayName,
    String? avatarUrl,
    @Default(0) int rank,
    @Default(0) int skillRating,
    @Default(PlayerStatus.offline) PlayerStatus status,
    @Default({}) Map<String, dynamic> metadata,
  }) = _Player;

  factory Player.fromJson(Map<String, dynamic> json) =>
      _$PlayerFromJson(json);
}

@freezed
class MatchPlayer with _$MatchPlayer {
  const factory MatchPlayer({
    required Player player,
    @Default(0) int teamId,
    @Default(false) bool isReady,
    @Default(0) int latencyMs,
  }) = _MatchPlayer;

  factory MatchPlayer.fromJson(Map<String, dynamic> json) =>
      _$MatchPlayerFromJson(json);
}
