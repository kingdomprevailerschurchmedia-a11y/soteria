// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'performance_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for the [PerformanceService].

@ProviderFor(performanceService)
final performanceServiceProvider = PerformanceServiceProvider._();

/// Provider for the [PerformanceService].

final class PerformanceServiceProvider
    extends
        $FunctionalProvider<
          PerformanceService,
          PerformanceService,
          PerformanceService
        >
    with $Provider<PerformanceService> {
  /// Provider for the [PerformanceService].
  PerformanceServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'performanceServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$performanceServiceHash();

  @$internal
  @override
  $ProviderElement<PerformanceService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PerformanceService create(Ref ref) {
    return performanceService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PerformanceService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PerformanceService>(value),
    );
  }
}

String _$performanceServiceHash() =>
    r'8a09e9d3465c176e71298796d47b94279591a1c2';
