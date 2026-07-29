// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deep_link_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DeepLinkController)
final deepLinkControllerProvider = DeepLinkControllerProvider._();

final class DeepLinkControllerProvider
    extends $NotifierProvider<DeepLinkController, Uri?> {
  DeepLinkControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deepLinkControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deepLinkControllerHash();

  @$internal
  @override
  DeepLinkController create() => DeepLinkController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Uri? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Uri?>(value),
    );
  }
}

String _$deepLinkControllerHash() =>
    r'9d848cae8d7e0c3730bb9fbe25ddbb7adc155ae0';

abstract class _$DeepLinkController extends $Notifier<Uri?> {
  Uri? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<Uri?, Uri?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Uri?, Uri?>,
              Uri?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
