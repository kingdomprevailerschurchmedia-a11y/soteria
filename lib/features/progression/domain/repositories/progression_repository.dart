import '../entities/player_progression.dart';
import '../entities/progression_profile.dart';
import '../entities/reward.dart';

abstract class ProgressionRepository {
  Future<PlayerProgression> getPlayerProgression(String playerId);
  Future<void> savePlayerProgression(PlayerProgression progression);
  Future<ProgressionProfile> getProfile(String mode);
  Future<List<Achievement>> getAchievements();
  Future<void> unlockAchievement(String achievementId);
  Future<void> grantReward(Reward reward);
}
