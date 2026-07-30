import '../data/data_sources/local_rules_data_source.dart';

class RulesCacheManager {
  final LocalRulesDataSource _localDataSource;

  RulesCacheManager(this._localDataSource);

  Future<void> clearCache() async {
    await _localDataSource.cacheRules([]);
  }

  Future<bool> hasValidCache() async {
    final rules = await _localDataSource.getCachedRules();
    return rules.isNotEmpty;
  }
}
