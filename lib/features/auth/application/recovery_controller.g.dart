// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recovery_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Notifier that manages the multi-step account recovery process.

@ProviderFor(RecoveryController)
final recoveryControllerProvider = RecoveryControllerProvider._();

/// Notifier that manages the multi-step account recovery process.
final class RecoveryControllerProvider
    extends $NotifierProvider<RecoveryController, RecoverySession> {
  /// Notifier that manages the multi-step account recovery process.
  RecoveryControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recoveryControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recoveryControllerHash();

  @$internal
  @override
  RecoveryController create() => RecoveryController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RecoverySession value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RecoverySession>(value),
    );
  }
}

String _$recoveryControllerHash() =>
    r'570606fdf0aba0afb35d7ab6c7fa0c721ad67c90';

/// Notifier that manages the multi-step account recovery process.

abstract class _$RecoveryController extends $Notifier<RecoverySession> {
  RecoverySession build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<RecoverySession, RecoverySession>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<RecoverySession, RecoverySession>,
              RecoverySession,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
