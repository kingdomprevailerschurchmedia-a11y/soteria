import '../domain/models/game_mode.dart';
import '../domain/models/game_rules.dart';
import '../domain/repositories/rules_repository.dart';
import 'rules_resolver.dart';

class GameRulesEngine {
  final RulesRepository _repository;
  final RulesResolver _resolver;

  GameRulesEngine({
    required RulesRepository repository,
    required RulesResolver resolver,
  })  : _repository = repository,
        _resolver = resolver;

  Future<GameRules> getActiveRules(GameMode mode, {String? tournamentId, String? eventId}) async {
    final baseRules = await _repository.getRulesForMode(mode);
    
    // In a full implementation, we would fetch tournament/event specific rules here
    // using the provided IDs and then resolve them.
    
    return _resolver.resolve(
      baseRules: baseRules,
      // tournamentRules: await _repository.getTournamentRules(tournamentId),
      // eventRules: await _repository.getEventRules(eventId),
    );
  }

  Future<void> refreshRules() async {
    await _repository.syncRules();
  }
}
