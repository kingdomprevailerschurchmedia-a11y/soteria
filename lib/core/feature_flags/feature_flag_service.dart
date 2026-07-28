import 'feature_flag.dart';

/// Centralized service to manage and evaluate Feature Flags.
class FeatureFlagService {
  FeatureFlagService({
    required List<FeatureFlag> initialFlags,
  }) : _flags = {
          for (final flag in initialFlags) flag.id: flag,
        };

  final Map<String, FeatureFlag> _flags;

  /// Returns true if the flag with [id] is enabled.
  bool isEnabled(String id) {
    return _flags[id]?.isEnabled ?? false;
  }

  /// Gets the full list of flags.
  List<FeatureFlag> getAllFlags() => _flags.values.toList();

  /// Updates the local override for a flag.
  void setOverride(String id, bool? value) {
    final flag = _flags[id];
    if (flag != null) {
      _flags[id] = flag.copyWith(localOverride: value);
    }
  }

  /// Updates the remote value for a flag.
  void setRemoteValue(String id, bool? value) {
    final flag = _flags[id];
    if (flag != null) {
      _flags[id] = flag.copyWith(remoteValue: value);
    }
  }

  /// Resets all overrides.
  void resetAll() {
    for (final id in _flags.keys) {
      _flags[id] = _flags[id]!.copyWith(localOverride: null);
    }
  }
}
