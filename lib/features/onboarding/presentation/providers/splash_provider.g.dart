// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Notifier that manages the duration of the premium splash experience.

@ProviderFor(SplashState)
final splashStateProvider = SplashStateProvider._();

/// Notifier that manages the duration of the premium splash experience.
final class SplashStateProvider extends $NotifierProvider<SplashState, bool> {
  /// Notifier that manages the duration of the premium splash experience.
  SplashStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'splashStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$splashStateHash();

  @$internal
  @override
  SplashState create() => SplashState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$splashStateHash() => r'bf41ab3e0da803f49476b6091049ecc60e0d747d';

/// Notifier that manages the duration of the premium splash experience.

abstract class _$SplashState extends $Notifier<bool> {
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
