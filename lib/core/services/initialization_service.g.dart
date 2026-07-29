// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initialization_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// AppInitializationService coordinates the background "warming" of foundation services
/// to reduce startup jank and keep the main initialization path as lean as possible.

@ProviderFor(AppInitializationService)
final appInitializationServiceProvider = AppInitializationServiceProvider._();

/// AppInitializationService coordinates the background "warming" of foundation services
/// to reduce startup jank and keep the main initialization path as lean as possible.
final class AppInitializationServiceProvider
    extends $NotifierProvider<AppInitializationService, bool> {
  /// AppInitializationService coordinates the background "warming" of foundation services
  /// to reduce startup jank and keep the main initialization path as lean as possible.
  AppInitializationServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appInitializationServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appInitializationServiceHash();

  @$internal
  @override
  AppInitializationService create() => AppInitializationService();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$appInitializationServiceHash() =>
    r'1af7d253fad2a6e47ff6e2c3c6b83a298cc23962';

/// AppInitializationService coordinates the background "warming" of foundation services
/// to reduce startup jank and keep the main initialization path as lean as possible.

abstract class _$AppInitializationService extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
