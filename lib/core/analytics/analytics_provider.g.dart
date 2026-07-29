// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for the centralized [AnalyticsService].

@ProviderFor(analyticsService)
final analyticsServiceProvider = AnalyticsServiceProvider._();

/// Provider for the centralized [AnalyticsService].

final class AnalyticsServiceProvider
    extends
        $FunctionalProvider<
          AnalyticsService,
          AnalyticsService,
          AnalyticsService
        >
    with $Provider<AnalyticsService> {
  /// Provider for the centralized [AnalyticsService].
  AnalyticsServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'analyticsServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$analyticsServiceHash();

  @$internal
  @override
  $ProviderElement<AnalyticsService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AnalyticsService create(Ref ref) {
    return analyticsService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AnalyticsService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AnalyticsService>(value),
    );
  }
}

String _$analyticsServiceHash() => r'9f5fe0f336f83e0fd8d47320ab88297a9c8faf27';

/// A notifier that exposes the current state of analytics for the dashboard.

@ProviderFor(AnalyticsState)
final analyticsStateProvider = AnalyticsStateProvider._();

/// A notifier that exposes the current state of analytics for the dashboard.
final class AnalyticsStateProvider
    extends $NotifierProvider<AnalyticsState, AnalyticsSnapshot> {
  /// A notifier that exposes the current state of analytics for the dashboard.
  AnalyticsStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'analyticsStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$analyticsStateHash();

  @$internal
  @override
  AnalyticsState create() => AnalyticsState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AnalyticsSnapshot value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AnalyticsSnapshot>(value),
    );
  }
}

String _$analyticsStateHash() => r'44c89fbc5c2198779d8be428966d8ef66245f20d';

/// A notifier that exposes the current state of analytics for the dashboard.

abstract class _$AnalyticsState extends $Notifier<AnalyticsSnapshot> {
  AnalyticsSnapshot build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AnalyticsSnapshot, AnalyticsSnapshot>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AnalyticsSnapshot, AnalyticsSnapshot>,
              AnalyticsSnapshot,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
