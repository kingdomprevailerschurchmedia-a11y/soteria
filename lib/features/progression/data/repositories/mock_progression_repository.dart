import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/player_progression.dart';
import '../../domain/entities/progression_profile.dart';
import '../../domain/entities/reward.dart';
import '../../domain/entities/reward_type.dart';
import '../../domain/repositories/progression_repository.dart';

class MockProgressionRepository implements ProgressionRepository {
  final SharedPreferences _prefs;
  static const _progressionKey = 'player_progression_v2';

  MockProgressionRepository(this._prefs);

  @override
  Future<PlayerProgression> getPlayerProgression(String playerId) async {
    final data = _prefs.getString(_progressionKey);
    if (data != null) {
      return PlayerProgression.fromJson(jsonDecode(data));
    }
    return PlayerProgression(playerId: playerId);
  }

  @override
  Future<void> savePlayerProgression(PlayerProgression progression) async {
    await _prefs.setString(_progressionKey, jsonEncode(progression.toJson()));
  }

  @override
  Future<ProgressionProfile> getProfile(String mode) async {
    // In a real app, these would come from a server or local config file
    switch (mode) {
      case 'pro':
        return const ProgressionProfile(
          id: 'pro',
          name: 'Professional Mode',
          baseQuestionScore: 20,
          baseMatchXP: 100,
        );
      case 'tournament':
        return const ProgressionProfile(
          id: 'tournament',
          name: 'Tournament Mode',
          baseQuestionScore: 50,
          baseMatchXP: 250,
        );
      default:
        return const ProgressionProfile(
          id: 'practice',
          name: 'Practice Mode',
        );
    }
  }

  @override
  Future<List<Achievement>> getAchievements() async {
    return [
      const Achievement(
        id: 'first_win',
        title: 'First Step',
        description: 'Win your first practice match.',
        icon: '🥇',
        xpReward: 50,
      ),
      const Achievement(
        id: 'perfect_round',
        title: 'Academic Excellence',
        description: 'Answer all questions correctly in a single round.',
        icon: '🎓',
        xpReward: 100,
      ),
      const Achievement(
        id: 'streak_10',
        title: 'On Fire',
        description: 'Maintain a 10-question correct answer streak.',
        icon: '🔥',
        xpReward: 200,
      ),
    ];
  }

  @override
  Future<void> unlockAchievement(String achievementId) async {
    // Logic to persist unlocked state
  }

  @override
  Future<void> grantReward(Reward reward) async {
    // Logic to add to wallet or inventory
  }
}
