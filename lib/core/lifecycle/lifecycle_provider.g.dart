// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lifecycle_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for the [AppLifecycleService].

@ProviderFor(appLifecycleService)
final appLifecycleServiceProvider = AppLifecycleServiceProvider._();

/// Provider for the [AppLifecycleService].

final class AppLifecycleServiceProvider
    extends
        $FunctionalProvider<
          AppLifecycleService,
          AppLifecycleService,
          AppLifecycleService
        >
    with $Provider<AppLifecycleService> {
  /// Provider for the [AppLifecycleService].
  AppLifecycleServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appLifecycleServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appLifecycleServiceHash();

  @$internal
  @override
  $ProviderElement<AppLifecycleService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AppLifecycleService create(Ref ref) {
    return appLifecycleService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppLifecycleService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppLifecycleService>(value),
    );
  }
}

String _$appLifecycleServiceHash() =>
    r'334e3b31a9b2c462eda69ce91ca641554acb0486';
