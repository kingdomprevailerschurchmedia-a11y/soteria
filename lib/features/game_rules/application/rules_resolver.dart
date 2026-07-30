import '../domain/models/game_mode.dart';
import '../domain/models/game_rules.dart';

class RulesResolver {
  /// Resolves the final set of rules for a given session by layering multiple rule sources.
  /// Priority order (highest wins):
  /// 1. Emergency Override (from metadata or specific source)
  /// 2. Live Event Rules
  /// 3. Tournament Rules
  /// 4. Game Mode Rules
  /// 5. Default Rules
  GameRules resolve({
    required GameRules baseRules,
    GameRules? tournamentRules,
    GameRules? eventRules,
    GameRules? emergencyOverride,
  }) {
    GameRules resolved = baseRules;

    if (tournamentRules != null) {
      resolved = _applyRules(resolved, tournamentRules);
    }

    if (eventRules != null) {
      resolved = _applyRules(resolved, eventRules);
    }

    if (emergencyOverride != null) {
      resolved = _applyRules(resolved, emergencyOverride);
    }

    return resolved;
  }

  GameRules _applyRules(GameRules base, GameRules override) {
    // Basic implementation: take override if present
    // A more complex version would merge specific fields
    return override.copyWith(
      priority: override.priority > base.priority ? override.priority : base.priority,
    );
  }
}
