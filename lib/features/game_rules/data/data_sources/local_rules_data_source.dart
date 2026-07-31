import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/models/game_rules.dart';
import '../../domain/models/game_mode.dart';

abstract class LocalRulesDataSource {
  Future<List<GameRules>> getCachedRules();
  Future<void> cacheRules(List<GameRules> rules);
  Future<String?> getRulesVersion();
  Future<void> saveRulesVersion(String version);
}

class LocalRulesDataSourceImpl implements LocalRulesDataSource {
  final SharedPreferences _prefs;
  static const _rulesKey = 'soteria_game_rules';
  static const _versionKey = 'soteria_rules_version';

  LocalRulesDataSourceImpl(this._prefs);

  @override
  Future<List<GameRules>> getCachedRules() async {
    final jsonString = _prefs.getString(_rulesKey);
    if (jsonString == null) return [];
    
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((e) => GameRules.fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Future<void> cacheRules(List<GameRules> rules) async {
    final jsonString = json.encode(rules.map((e) => e.toJson()).toList());
    await _prefs.setString(_rulesKey, jsonString);
  }

  @override
  Future<String?> getRulesVersion() async {
    return _prefs.getString(_versionKey);
  }

  @override
  Future<void> saveRulesVersion(String version) async {
    await _prefs.setString(_versionKey, version);
  }
}
