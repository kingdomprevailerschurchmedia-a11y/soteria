import 'package:freezed_annotation/freezed_annotation.dart';

part 'tournament_rules.freezed.dart';
part 'tournament_rules.g.dart';

@freezed
class TournamentRules with _$TournamentRules {
  const factory TournamentRules({
    required int entryFeeCoins,
    required int minRankRequired,
    required List<int> prizePoolDistribution,
    required bool leaderboardEligibility,
    required int maxParticipants,
  }) = _TournamentRules;

  factory TournamentRules.fromJson(Map<String, dynamic> json) =>
      _$TournamentRulesFromJson(json);
}
