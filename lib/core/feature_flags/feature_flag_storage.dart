import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// Handles persistent storage of Feature Flag overrides.
class FeatureFlagStorage {
  const FeatureFlagStorage(this._prefs);
  final SharedPreferences _prefs;

  static const String _key = 'soteria_feature_flag_overrides';

  /// Saves a map of flag ID to its override value.
  Future<void> saveOverrides(Map<String, bool> overrides) async {
    await _prefs.setString(_key, jsonEncode(overrides));
  }

  /// Loads the map of flag ID to its override value.
  Map<String, bool> loadOverrides() {
    final data = _prefs.getString(_key);
    if (data == null) return {};
    try {
      return Map<String, bool>.from(jsonDecode(data) as Map);
    } catch (_) {
      return {};
    }
  }

  /// Clears all local overrides.
  Future<void> clearOverrides() async {
    await _prefs.remove(_key);
  }
}
