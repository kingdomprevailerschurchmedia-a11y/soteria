import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'feature_flag.dart';
import 'feature_flag_registry.dart';
import 'feature_flag_service.dart';
import 'feature_flag_storage.dart';

part 'feature_flag_provider.g.dart';

/// Provider that exposes the state of all Feature Flags.
@Riverpod(keepAlive: true)
class FeatureFlags extends _$FeatureFlags {
  FeatureFlagStorage? _storage;
  FeatureFlagService? _service;
  bool _isInitialized = false;

  @override
  List<FeatureFlag> build() {
    // Initial empty state, will be populated by initialize()
    return [];
  }

  /// Initializes the feature flag system.
  Future<void> initialize(SharedPreferences prefs) async {
    if (_isInitialized) return;

    final storage = FeatureFlagStorage(prefs);
    _storage = storage;
    
    // Load overrides from storage
    final overrides = storage.loadOverrides();
    
    // Create initial list with overrides
    final initialFlags = FeatureFlagRegistry.defaults.map((flag) {
      return flag.copyWith(localOverride: overrides[flag.id]);
    }).toList();

    _service = FeatureFlagService(initialFlags: initialFlags);
    state = _service!.getAllFlags();
    _isInitialized = true;
  }

  /// Toggles a feature flag override.
  Future<void> toggleFlag(String id) async {
    final flag = state.firstWhere((f) => f.id == id);
    final newValue = !flag.isEnabled;
    
    _service?.setOverride(id, newValue);
    state = _service?.getAllFlags() ?? [];

    // Persist changes
    await _saveToStorage();
  }

  /// Resets a single flag override.
  Future<void> resetFlag(String id) async {
    _service?.setOverride(id, null);
    state = _service?.getAllFlags() ?? [];
    await _saveToStorage();
  }

  /// Resets all overrides.
  Future<void> resetAll() async {
    _service?.resetAll();
    state = _service?.getAllFlags() ?? [];
    await _storage?.clearOverrides();
  }

  Future<void> _saveToStorage() async {
    final overrides = <String, bool>{};
    for (final flag in state) {
      if (flag.localOverride != null) {
        overrides[flag.id] = flag.localOverride!;
      }
    }
    await _storage?.saveOverrides(overrides);
  }

  /// Helper to check if a flag is enabled without watching the whole list.
  bool isEnabled(String id) {
    return state.any((f) => f.id == id && f.isEnabled);
  }
}

/// Provider for a specific feature flag by ID.
@riverpod
bool featureEnabled(Ref ref, String id) {
  final flags = ref.watch(featureFlagsProvider);
  return flags.any((f) => f.id == id && f.isEnabled);
}
