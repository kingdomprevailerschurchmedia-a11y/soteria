import '../domain/models/game_rules.dart';
import '../domain/repositories/rules_repository.dart';
import 'rules_validator.dart';

class RulesLoader {
  final RulesRepository _repository;
  final RulesValidator _validator;

  RulesLoader(this._repository, this._validator);

  Future<List<GameRules>> loadAndValidate() async {
    final rules = await _repository.getAllRules();
    return rules.where((r) => _validator.validate(r)).toList();
  }
}
