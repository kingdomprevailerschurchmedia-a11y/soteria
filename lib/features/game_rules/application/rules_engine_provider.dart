import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'game_rules_engine.dart';
import 'rules_notifier.dart';
import 'rules_resolver.dart';

part 'rules_engine_provider.g.dart';

@riverpod
RulesResolver rulesResolver(RulesResolverRef ref) {
  return RulesResolver();
}

@riverpod
GameRulesEngine gameRulesEngine(GameRulesEngineRef ref) {
  final repository = ref.watch(rulesRepositoryProvider);
  final resolver = ref.watch(rulesResolverProvider);
  
  return GameRulesEngine(
    repository: repository,
    resolver: resolver,
  );
}
