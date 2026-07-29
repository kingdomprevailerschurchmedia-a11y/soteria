// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overlay_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OverlayController)
final overlayControllerProvider = OverlayControllerProvider._();

final class OverlayControllerProvider
    extends $NotifierProvider<OverlayController, OverlayState> {
  OverlayControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'overlayControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$overlayControllerHash();

  @$internal
  @override
  OverlayController create() => OverlayController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OverlayState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OverlayState>(value),
    );
  }
}

String _$overlayControllerHash() => r'3a6f7d6de3e72c86661304cf24c66a26ceedde27';

abstract class _$OverlayController extends $Notifier<OverlayState> {
  OverlayState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<OverlayState, OverlayState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<OverlayState, OverlayState>,
              OverlayState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
