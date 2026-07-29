// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NotificationController)
final notificationControllerProvider = NotificationControllerProvider._();

final class NotificationControllerProvider
    extends $NotifierProvider<NotificationController, NotificationState> {
  NotificationControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notificationControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notificationControllerHash();

  @$internal
  @override
  NotificationController create() => NotificationController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NotificationState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NotificationState>(value),
    );
  }
}

String _$notificationControllerHash() =>
    r'8db5b1f009fec8d92e7a4dd9a5fd57bc6cfedf23';

abstract class _$NotificationController extends $Notifier<NotificationState> {
  NotificationState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<NotificationState, NotificationState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<NotificationState, NotificationState>,
              NotificationState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
