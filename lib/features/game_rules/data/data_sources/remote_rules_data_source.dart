import '../../domain/models/game_rules.dart';

abstract class RemoteRulesDataSource {
  Future<List<GameRules>> fetchLatestRules();
  Future<String> fetchLatestVersion();
}

/// A mock implementation that could be replaced by a Firebase Remote Config implementation
class RemoteRulesDataSourceImpl implements RemoteRulesDataSource {
  @override
  Future<List<GameRules>> fetchLatestRules() async {
    // In a real app, this would call an API or Firebase Remote Config
    // For now, returning empty or could return defaults if needed
    return [];
  }

  @override
  Future<String> fetchLatestVersion() async {
    return "1.0.0";
  }
}
