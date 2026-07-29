// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'startup_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provides the SharedPreferences instance after it has been initialized in main().

@ProviderFor(sharedPreferences)
final sharedPreferencesProvider = SharedPreferencesProvider._();

/// Provides the SharedPreferences instance after it has been initialized in main().

final class SharedPreferencesProvider
    extends
        $FunctionalProvider<
          SharedPreferences,
          SharedPreferences,
          SharedPreferences
        >
    with $Provider<SharedPreferences> {
  /// Provides the SharedPreferences instance after it has been initialized in main().
  SharedPreferencesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sharedPreferencesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sharedPreferencesHash();

  @$internal
  @override
  $ProviderElement<SharedPreferences> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SharedPreferences create(Ref ref) {
    return sharedPreferences(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SharedPreferences value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SharedPreferences>(value),
    );
  }
}

String _$sharedPreferencesHash() => r'4b99ffc5961899ff848eb43ccd283b363718ee2f';

/// Provides the PackageInfo instance after it has been initialized in main().

@ProviderFor(packageInfo)
final packageInfoProvider = PackageInfoProvider._();

/// Provides the PackageInfo instance after it has been initialized in main().

final class PackageInfoProvider
    extends $FunctionalProvider<PackageInfo, PackageInfo, PackageInfo>
    with $Provider<PackageInfo> {
  /// Provides the PackageInfo instance after it has been initialized in main().
  PackageInfoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'packageInfoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$packageInfoHash();

  @$internal
  @override
  $ProviderElement<PackageInfo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PackageInfo create(Ref ref) {
    return packageInfo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PackageInfo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PackageInfo>(value),
    );
  }
}

String _$packageInfoHash() => r'c25eaa492dd29022f9cfeb6e64af555bfe495baa';

/// Provider that handles secondary application startup logic (like DotEnv).

@ProviderFor(appStartup)
final appStartupProvider = AppStartupProvider._();

/// Provider that handles secondary application startup logic (like DotEnv).

final class AppStartupProvider
    extends
        $FunctionalProvider<
          AsyncValue<AppConfig>,
          AppConfig,
          FutureOr<AppConfig>
        >
    with $FutureModifier<AppConfig>, $FutureProvider<AppConfig> {
  /// Provider that handles secondary application startup logic (like DotEnv).
  AppStartupProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appStartupProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appStartupHash();

  @$internal
  @override
  $FutureProviderElement<AppConfig> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<AppConfig> create(Ref ref) {
    return appStartup(ref);
  }
}

String _$appStartupHash() => r'3cd4156e2ab608dfb43ae6a46c78932077348ee6';
