// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Notifier that manages local progress for guest users.

@ProviderFor(GuestController)
final guestControllerProvider = GuestControllerProvider._();

/// Notifier that manages local progress for guest users.
final class GuestControllerProvider
    extends $NotifierProvider<GuestController, GuestProgress> {
  /// Notifier that manages local progress for guest users.
  GuestControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'guestControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$guestControllerHash();

  @$internal
  @override
  GuestController create() => GuestController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GuestProgress value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GuestProgress>(value),
    );
  }
}

String _$guestControllerHash() => r'a8d5f059d77bd41183622ddb223c4f4497f9b812';

/// Notifier that manages local progress for guest users.

abstract class _$GuestController extends $Notifier<GuestProgress> {
  GuestProgress build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<GuestProgress, GuestProgress>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GuestProgress, GuestProgress>,
              GuestProgress,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
