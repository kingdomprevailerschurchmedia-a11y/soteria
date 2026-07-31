import 'dart:async';
import '../../domain/models/game_mode.dart';
import '../../domain/models/game_rules.dart';
import '../../domain/repositories/rules_repository.dart';
import '../data_sources/local_rules_data_source.dart';
import '../data_sources/remote_rules_data_source.dart';

class RulesRepositoryImpl implements RulesRepository {
  final LocalRulesDataSource localDataSource;
  final RemoteRulesDataSource remoteDataSource;
  
  final _rulesController = StreamController<List<GameRules>>.broadcast();

  RulesRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<List<GameRules>> getAllRules() async {
    final cached = await localDataSource.getCachedRules();
    if (cached.isNotEmpty) {
      return cached;
    }
    // If no cache, sync and return
    await syncRules();
    return localDataSource.getCachedRules();
  }

  @override
  Future<GameRules> getRulesForMode(GameMode mode) async {
    final allRules = await getAllRules();
    return allRules.firstWhere(
      (r) => r.mode == mode,
      orElse: () => _getDefaultRules(mode),
    );
  }

  @override
  Future<String> getRulesVersion() async {
    return await localDataSource.getRulesVersion() ?? '0.0.0';
  }

  @override
  Future<void> syncRules() async {
    try {
      final remoteVersion = await remoteDataSource.fetchLatestVersion();
      final localVersion = await getRulesVersion();

      if (remoteVersion != localVersion) {
        final newRules = await remoteDataSource.fetchLatestRules();
        if (newRules.isNotEmpty) {
          await localDataSource.cacheRules(newRules);
          await localDataSource.saveRulesVersion(remoteVersion);
          _rulesController.add(newRules);
        }
      }
    } catch (e) {
      // Handle error or log
    }
  }

  @override
  Future<void> updateLocalRules(List<GameRules> rules) async {
    await localDataSource.cacheRules(rules);
    _rulesController.add(rules);
  }

  @override
  Stream<GameRules> watchRulesForMode(GameMode mode) {
    return _rulesController.stream.map((rules) => rules.firstWhere(
      (r) => r.mode == mode,
      orElse: () => _getDefaultRules(mode),
    ));
  }

  GameRules _getDefaultRules(GameMode mode) {
    // Basic defaults if nothing is found
    // In practice, these would be hardcoded defaults in a 'DefaultRules' class
    // following the priority: Emergency -> Event -> Tournament -> Mode -> Default
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
