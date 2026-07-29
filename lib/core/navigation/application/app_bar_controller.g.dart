// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_bar_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppBarController)
final appBarControllerProvider = AppBarControllerProvider._();

final class AppBarControllerProvider
    extends $NotifierProvider<AppBarController, AppBarState> {
  AppBarControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appBarControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appBarControllerHash();

  @$internal
  @override
  AppBarController create() => AppBarController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppBarState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppBarState>(value),
    );
  }
}

String _$appBarControllerHash() => r'bd1781f611b324fc32d4753e5ba6c4b8e4cbc3b4';

abstract class _$AppBarController extends $Notifier<AppBarState> {
  AppBarState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AppBarState, AppBarState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppBarState, AppBarState>,
              AppBarState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
