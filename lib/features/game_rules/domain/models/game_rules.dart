import 'package:freezed_annotation/freezed_annotation.dart';
import 'timer_rules.dart';
import 'reward_rules.dart';
import 'difficulty_rules.dart';
import 'assist_rules.dart';
import 'tournament_rules.dart';
import 'game_mode.dart';

part 'game_rules.freezed.dart';
part 'game_rules.g.dart';

@freezed
class GameRules with _$GameRules {
  const factory GameRules({
    required String id,
    required String version,
    required GameMode mode,
    required TimerRules timer,
    required RewardRules rewards,
    required DifficultyRules difficulty,
    required AssistRules assists,
    TournamentRules? tournament,
    @Default({}) Map<String, dynamic> metadata,
    @Default(100) int priority,
  }) = _GameRules;

  factory GameRules.fromJson(Map<String, dynamic> json) =>
      _$GameRulesFromJson(json);
}
