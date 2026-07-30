import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/models/game_mode.dart';
import '../domain/models/game_rules.dart';
import '../domain/repositories/rules_repository.dart';
import '../data/repositories/rules_repository_impl.dart';
import '../data/data_sources/local_rules_data_source.dart';
import '../data/data_sources/remote_rules_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'rules_notifier.g.dart';

@riverpod
Future<SharedPreferences> sharedPreferences(SharedPreferencesRef ref) {
  return SharedPreferences.getInstance();
}

@riverpod
RulesRepository rulesRepository(RulesRepositoryRef ref) {
  final prefs = ref.watch(sharedPreferencesProvider).value;
  if (prefs == null) throw Exception('SharedPreferences not initialized');
  
  return RulesRepositoryImpl(
    localDataSource: LocalRulesDataSourceImpl(prefs),
    remoteDataSource: RemoteRulesDataSourceImpl(),
  );
}

@riverpod
class GameRulesNotifier extends _$GameRulesNotifier {
  @override
  FutureOr<Map<GameMode, GameRules>> build() async {
    final repository = ref.watch(rulesRepositoryProvider);
    final allRules = await repository.getAllRules();
    
    final Map<GameMode, GameRules> rulesMap = {};
    for (final mode in GameMode.values) {
      rulesMap[mode] = allRules.firstWhere(
        (r) => r.mode == mode,
        orElse: () => _getDefaultRules(mode),
      );
    }
    return rulesMap;
  }

  Future<void> sync() async {
    state = const AsyncLoading();
    final repository = ref.read(rulesRepositoryProvider);
    await repository.syncRules();
    ref.invalidateSelf();
  }

  GameRules _getDefaultRules(GameMode mode) {
    // Duplicate of logic in repository for safety in notifier
    return GameRules(
      id: 'default_${mode.name}',
      version: '1.0.0',
      mode: mode,
      timer: const TimerRules(
        questionTimerSeconds: 30,
        minTimerSeconds: 5,
        maxTimerSeconds: 60,
        reconnectTimeoutSeconds: 15,
        sessionTimeoutSeconds: 300,
      ),
      rewards: const RewardRules(
        baseXP: 10,
        baseCoins: 5,
        baseReputation: 1,
        streakMultiplier: 1.1,
        maxStreakBonus: 50,
      ),
      difficulty: const DifficultyRules(
        initialDifficulty: 'Medium',
        adaptiveProgression: true,
        scalingFactor: 1.0,
        maxDifficultyLevel: 10,
      ),
      assists: const AssistRules(
        allowKnowledgeAssist: true,
        maxAssistsPerSession: 3,
        cooldownSeconds: 60,
        assistTypeLimits: {},
      ),
    );
  }
}
