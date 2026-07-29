// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accessibility_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for the [AccessibilityService].

@ProviderFor(accessibilityService)
final accessibilityServiceProvider = AccessibilityServiceProvider._();

/// Provider for the [AccessibilityService].

final class AccessibilityServiceProvider
    extends
        $FunctionalProvider<
          AccessibilityService,
          AccessibilityService,
          AccessibilityService
        >
    with $Provider<AccessibilityService> {
  /// Provider for the [AccessibilityService].
  AccessibilityServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'accessibilityServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$accessibilityServiceHash();

  @$internal
  @override
  $ProviderElement<AccessibilityService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AccessibilityService create(Ref ref) {
    return accessibilityService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AccessibilityService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AccessibilityService>(value),
    );
  }
}

String _$accessibilityServiceHash() =>
    r'30a1814779ba1617a0c2872defee422c19e12fb1';
