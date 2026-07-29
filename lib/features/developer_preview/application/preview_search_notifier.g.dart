// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preview_search_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Notifier that handles searching and filtering of preview items.

@ProviderFor(PreviewSearchNotifier)
final previewSearchProvider = PreviewSearchNotifierProvider._();

/// Notifier that handles searching and filtering of preview items.
final class PreviewSearchNotifierProvider
    extends $NotifierProvider<PreviewSearchNotifier, String> {
  /// Notifier that handles searching and filtering of preview items.
  PreviewSearchNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'previewSearchProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$previewSearchNotifierHash();

  @$internal
  @override
  PreviewSearchNotifier create() => PreviewSearchNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$previewSearchNotifierHash() =>
    r'f0c064f05e8c39982abcfd31441a402f1d159ff2';

/// Notifier that handles searching and filtering of preview items.

abstract class _$PreviewSearchNotifier extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
