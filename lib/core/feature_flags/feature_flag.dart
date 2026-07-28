import 'feature_flag_group.dart';

/// Represents a single Feature Flag in the system.
class FeatureFlag {
  const FeatureFlag({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.defaultValue,
    this.localOverride,
    this.remoteValue,
  });

  final String id;
  final String name;
  final String description;
  final FeatureCategory category;
  final bool defaultValue;
  final bool? localOverride;
  final bool? remoteValue;

  /// Returns the final evaluated state of the flag.
  /// Evaluation Order: Local Override > Remote Value > Default Value.
  bool get isEnabled {
    if (localOverride != null) return localOverride!;
    if (remoteValue != null) return remoteValue!;
    return defaultValue;
  }

  FeatureFlag copyWith({
    String? id,
    String? name,
    String? description,
    FeatureCategory? category,
    bool? defaultValue,
    bool? localOverride,
    bool? remoteValue,
  }) {
    return FeatureFlag(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      defaultValue: defaultValue ?? this.defaultValue,
      localOverride: localOverride ?? this.localOverride,
      remoteValue: remoteValue ?? this.remoteValue,
    );
  }

  /// Helper to create a version with an explicit null local override.
  FeatureFlag withResetOverride() {
    return FeatureFlag(
      id: id,
      name: name,
      description: description,
      category: category,
      defaultValue: defaultValue,
      localOverride: null,
      remoteValue: remoteValue,
    );
  }
}
