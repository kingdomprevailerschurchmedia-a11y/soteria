import 'package:flutter_test/flutter_test.dart';
import 'package:soteria/features/progression/domain/entities/player_progression.dart';

void main() {
  group('PlayerProgression Logic', () {
    test('progressToNextLevel calculation', () {
      const progression = PlayerProgression(
        playerId: '1',
        currentXP: 50,
        nextLevelXP: 100,
      );
      expect(progression.progressToNextLevel, 0.5);
    });

    test('initial state defaults', () {
      const progression = PlayerProgression(playerId: '1');
      expect(progression.level, 1);
      expect(progression.currentXP, 0);
      expect(progression.reputation, 1000);
    });
  });
}
