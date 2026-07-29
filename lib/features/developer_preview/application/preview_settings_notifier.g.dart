// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preview_settings_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Notifier that manages the preview environment state.

@ProviderFor(PreviewSettingsNotifier)
final previewSettingsProvider = PreviewSettingsNotifierProvider._();

/// Notifier that manages the preview environment state.
final class PreviewSettingsNotifierProvider
    extends $NotifierProvider<PreviewSettingsNotifier, PreviewSettings> {
  /// Notifier that manages the preview environment state.
  PreviewSettingsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'previewSettingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$previewSettingsNotifierHash();

  @$internal
  @override
  PreviewSettingsNotifier create() => PreviewSettingsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PreviewSettings value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PreviewSettings>(value),
    );
  }
}

String _$previewSettingsNotifierHash() =>
    r'925677c69f85d0052b28bda1c3bb6624d4c2ac5f';

/// Notifier that manages the preview environment state.

abstract class _$PreviewSettingsNotifier extends $Notifier<PreviewSettings> {
  PreviewSettings build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<PreviewSettings, PreviewSettings>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PreviewSettings, PreviewSettings>,
              PreviewSettings,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
