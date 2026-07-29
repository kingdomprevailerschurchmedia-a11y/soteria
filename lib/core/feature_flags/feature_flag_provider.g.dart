// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_flag_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider that exposes the state of all Feature Flags.

@ProviderFor(FeatureFlags)
final featureFlagsProvider = FeatureFlagsProvider._();

/// Provider that exposes the state of all Feature Flags.
final class FeatureFlagsProvider
    extends $NotifierProvider<FeatureFlags, List<FeatureFlag>> {
  /// Provider that exposes the state of all Feature Flags.
  FeatureFlagsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'featureFlagsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$featureFlagsHash();

  @$internal
  @override
  FeatureFlags create() => FeatureFlags();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<FeatureFlag> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<FeatureFlag>>(value),
    );
  }
}

String _$featureFlagsHash() => r'643843eff048a058cb7ff9a0032d1517e3dc1317';

/// Provider that exposes the state of all Feature Flags.

abstract class _$FeatureFlags extends $Notifier<List<FeatureFlag>> {
  List<FeatureFlag> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<List<FeatureFlag>, List<FeatureFlag>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<FeatureFlag>, List<FeatureFlag>>,
              List<FeatureFlag>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// Provider for a specific feature flag by ID.

@ProviderFor(featureEnabled)
final featureEnabledProvider = FeatureEnabledFamily._();

/// Provider for a specific feature flag by ID.

final class FeatureEnabledProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// Provider for a specific feature flag by ID.
  FeatureEnabledProvider._({
    required FeatureEnabledFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'featureEnabledProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$featureEnabledHash();

  @override
  String toString() {
    return r'featureEnabledProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    final argument = this.argument as String;
    return featureEnabled(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FeatureEnabledProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$featureEnabledHash() => r'0f7a75e4ed96229c748f1f9ccaf5412aaf0f01f5';

/// Provider for a specific feature flag by ID.

final class FeatureEnabledFamily extends $Family
    with $FunctionalFamilyOverride<bool, String> {
  FeatureEnabledFamily._()
    : super(
        retry: null,
        name: r'featureEnabledProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provider for a specific feature flag by ID.

  FeatureEnabledProvider call(String id) =>
      FeatureEnabledProvider._(argument: id, from: this);

  @override
  String toString() => r'featureEnabledProvider';
}
