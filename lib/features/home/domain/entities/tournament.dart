import 'package:freezed_annotation/freezed_annotation.dart';

part 'tournament.freezed.dart';
part 'tournament.g.dart';

@freezed
abstract class Tournament with _$Tournament {
  const factory Tournament({
    required String id,
    required String title,
    required String prizePool,
    required String timeLeft,
    required String entryFee,
    required String category,
  }) = _Tournament;

  factory Tournament.fromJson(Map<String, dynamic> json) =>
      _$TournamentFromJson(json);
}
