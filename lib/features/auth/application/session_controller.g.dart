// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Notifier that manages the global user session lifecycle.

@ProviderFor(SessionController)
final sessionControllerProvider = SessionControllerProvider._();

/// Notifier that manages the global user session lifecycle.
final class SessionControllerProvider
    extends $NotifierProvider<SessionController, Session> {
  /// Notifier that manages the global user session lifecycle.
  SessionControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sessionControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sessionControllerHash();

  @$internal
  @override
  SessionController create() => SessionController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Session value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Session>(value),
    );
  }
}

String _$sessionControllerHash() => r'dc73f2301e7df71e57faf62bfafa73eb1e53bf0c';

/// Notifier that manages the global user session lifecycle.

abstract class _$SessionController extends $Notifier<Session> {
  Session build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<Session, Session>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Session, Session>,
              Session,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
