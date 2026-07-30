import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/entities/player_progression.dart';
import '../domain/constants/progression_constants.dart';
import '../presentation/providers/progression_providers.dart';
import '../../auth/presentation/providers/auth_providers.dart';

part 'progression_controller.g.dart';

@riverpod
class ProgressionController extends _$ProgressionController {
  @override
  Future<PlayerProgression> build() async {
    final user = ref.watch(authStateProvider).user;
    if (user == null) throw Exception('User not authenticated');
    
    return ref.read(progressionRepositoryProvider).getPlayerProgression(user.id);
  }

  Future<void> addXP(int amount) async {
    final current = await future;
    var newXP = current.currentXP + amount;
    var newTotalXP = current.totalXP + amount;
    var newLevel = current.level;
    var nextLevelXP = current.nextLevelXP;

    while (newXP >= nextLevelXP) {
      newXP -= nextLevelXP;
      newLevel++;
      nextLevelXP = (nextLevelXP * ProgressionConstants.levelXpMultiplier).toInt();
      _triggerLevelUp(newLevel);
    }

    final updated = current.copyWith(
      currentXP: newXP,
      totalXP: newTotalXP,
      level: newLevel,
      nextLevelXP: nextLevelXP,
    );

    state = AsyncValue.data(updated);
    await ref.read(progressionRepositoryProvider).savePlayerProgression(updated);
  }

  Future<void> updateStreak(bool isCorrect) async {
    final current = await future;
    int newStreak = isCorrect ? current.currentStreak + 1 : 0;
    int newLongest = newStreak > current.longestStreak ? newStreak : current.longestStreak;

    final updated = current.copyWith(
      currentStreak: newStreak,
      longestStreak: newLongest,
    );

    state = AsyncValue.data(updated);
    await ref.read(progressionRepositoryProvider).savePlayerProgression(updated);
    
    if (newStreak == ProgressionConstants.majorStreakThreshold) {
      _triggerAchievement('streak_10');
    }
  }

  void _triggerLevelUp(int level) {
    // Analytics/Notification
  }

  void _triggerAchievement(String id) {
    // Analytics/Notification
  }
}
