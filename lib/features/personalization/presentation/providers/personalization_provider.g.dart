// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personalization_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(personalizationRepository)
final personalizationRepositoryProvider = PersonalizationRepositoryProvider._();

final class PersonalizationRepositoryProvider
    extends
        $FunctionalProvider<
          PersonalizationRepository,
          PersonalizationRepository,
          PersonalizationRepository
        >
    with $Provider<PersonalizationRepository> {
  PersonalizationRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'personalizationRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$personalizationRepositoryHash();

  @$internal
  @override
  $ProviderElement<PersonalizationRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PersonalizationRepository create(Ref ref) {
    return personalizationRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PersonalizationRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PersonalizationRepository>(value),
    );
  }
}

String _$personalizationRepositoryHash() =>
    r'4a59aea94497f545b91a941e1e8d430be512d946';

@ProviderFor(PersonalizationNotifier)
final personalizationProvider = PersonalizationNotifierProvider._();

final class PersonalizationNotifierProvider
    extends $NotifierProvider<PersonalizationNotifier, PersonalizationState> {
  PersonalizationNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'personalizationProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$personalizationNotifierHash();

  @$internal
  @override
  PersonalizationNotifier create() => PersonalizationNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PersonalizationState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PersonalizationState>(value),
    );
  }
}

String _$personalizationNotifierHash() =>
    r'2617fd3f0e607da6018f6ea76f94f67c74810c54';

abstract class _$PersonalizationNotifier
    extends $Notifier<PersonalizationState> {
  PersonalizationState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<PersonalizationState, PersonalizationState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PersonalizationState, PersonalizationState>,
              PersonalizationState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
