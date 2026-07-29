// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(homeRepository)
final homeRepositoryProvider = HomeRepositoryProvider._();

final class HomeRepositoryProvider
    extends $FunctionalProvider<HomeRepository, HomeRepository, HomeRepository>
    with $Provider<HomeRepository> {
  HomeRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeRepositoryHash();

  @$internal
  @override
  $ProviderElement<HomeRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HomeRepository create(Ref ref) {
    return homeRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HomeRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HomeRepository>(value),
    );
  }
}

String _$homeRepositoryHash() => r'648694fde419669d4aab2f617fb89bd7ea0964a4';

@ProviderFor(HomeState)
final homeStateProvider = HomeStateProvider._();

final class HomeStateProvider
    extends $NotifierProvider<HomeState, Result<HomeDashboard>> {
  HomeStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeStateHash();

  @$internal
  @override
  HomeState create() => HomeState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Result<HomeDashboard> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Result<HomeDashboard>>(value),
    );
  }
}

String _$homeStateHash() => r'8cfd987a13856c15c9f7e60975e56b722b4a3ac9';

abstract class _$HomeState extends $Notifier<Result<HomeDashboard>> {
  Result<HomeDashboard> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<Result<HomeDashboard>, Result<HomeDashboard>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Result<HomeDashboard>, Result<HomeDashboard>>,
              Result<HomeDashboard>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
