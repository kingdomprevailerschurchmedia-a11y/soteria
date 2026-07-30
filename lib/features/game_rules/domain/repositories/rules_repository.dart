import '../models/game_rules.dart';
import '../models/game_mode.dart';

abstract class RulesRepository {
  Future<GameRules> getRulesForMode(GameMode mode);
  Future<List<GameRules>> getAllRules();
  Future<void> syncRules();
  Stream<GameRules> watchRulesForMode(GameMode mode);
  Future<void> updateLocalRules(List<GameRules> rules);
  Future<String> getRulesVersion();
}
