import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_progression.freezed.dart';
part 'player_progression.g.dart';

@freezed
class PlayerProgression with _$PlayerProgression {
  const factory PlayerProgression({
    required String playerId,
    @Default(1) int level,
    @Default(0) int currentXP,
    @Default(0) int totalXP,
    @Default(100) int nextLevelXP,
    @Default(1000) int reputation,
    @Default(0) int currentStreak,
    @Default(0) int longestStreak,
    @Default(0) int totalCoins,
  }) = _PlayerProgression;

  const PlayerProgression._();

  factory PlayerProgression.fromJson(Map<String, dynamic> json) => _$PlayerProgressionFromJson(json);

  double get progressToNextLevel => currentXP / nextLevelXP;
}
