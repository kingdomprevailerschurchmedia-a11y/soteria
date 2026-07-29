// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provides the data source for authentication.

@ProviderFor(authDataSource)
final authDataSourceProvider = AuthDataSourceProvider._();

/// Provides the data source for authentication.

final class AuthDataSourceProvider
    extends
        $FunctionalProvider<
          MockAuthenticationDataSource,
          MockAuthenticationDataSource,
          MockAuthenticationDataSource
        >
    with $Provider<MockAuthenticationDataSource> {
  /// Provides the data source for authentication.
  AuthDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authDataSourceHash();

  @$internal
  @override
  $ProviderElement<MockAuthenticationDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MockAuthenticationDataSource create(Ref ref) {
    return authDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MockAuthenticationDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MockAuthenticationDataSource>(value),
    );
  }
}

String _$authDataSourceHash() => r'be4972d34ed4b9e2661c20e13872b4c0a9075f20';

/// Provides the local data source for session management.

@ProviderFor(sessionLocalDataSource)
final sessionLocalDataSourceProvider = SessionLocalDataSourceProvider._();

/// Provides the local data source for session management.

final class SessionLocalDataSourceProvider
    extends
        $FunctionalProvider<
          SessionLocalDataSource,
          SessionLocalDataSource,
          SessionLocalDataSource
        >
    with $Provider<SessionLocalDataSource> {
  /// Provides the local data source for session management.
  SessionLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sessionLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sessionLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<SessionLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SessionLocalDataSource create(Ref ref) {
    return sessionLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SessionLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SessionLocalDataSource>(value),
    );
  }
}

String _$sessionLocalDataSourceHash() =>
    r'2f4a5426a39674f52ba4e63bf3cfe3f2b86b43d8';

/// Provides the repository for authentication.

@ProviderFor(authenticationRepository)
final authenticationRepositoryProvider = AuthenticationRepositoryProvider._();

/// Provides the repository for authentication.

final class AuthenticationRepositoryProvider
    extends
        $FunctionalProvider<
          AuthenticationRepository,
          AuthenticationRepository,
          AuthenticationRepository
        >
    with $Provider<AuthenticationRepository> {
  /// Provides the repository for authentication.
  AuthenticationRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authenticationRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authenticationRepositoryHash();

  @$internal
  @override
  $ProviderElement<AuthenticationRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AuthenticationRepository create(Ref ref) {
    return authenticationRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthenticationRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthenticationRepository>(value),
    );
  }
}

String _$authenticationRepositoryHash() =>
    r'eef7db2a7ece7dc5e64df6b6e2ca4b24cb0320e8';

/// Provides the local repository for guest data.

@ProviderFor(guestRepository)
final guestRepositoryProvider = GuestRepositoryProvider._();

/// Provides the local repository for guest data.

final class GuestRepositoryProvider
    extends
        $FunctionalProvider<GuestRepository, GuestRepository, GuestRepository>
    with $Provider<GuestRepository> {
  /// Provides the local repository for guest data.
  GuestRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'guestRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$guestRepositoryHash();

  @$internal
  @override
  $ProviderElement<GuestRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GuestRepository create(Ref ref) {
    return guestRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GuestRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GuestRepository>(value),
    );
  }
}

String _$guestRepositoryHash() => r'22d26030e760ca4d22bbaf1345d7279bc6df7d44';

/// Exposes the user's authentication state.

@ProviderFor(authState)
final authStateProvider = AuthStateProvider._();

/// Exposes the user's authentication state.

final class AuthStateProvider
    extends $FunctionalProvider<AuthState, AuthState, AuthState>
    with $Provider<AuthState> {
  /// Exposes the user's authentication state.
  AuthStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authStateHash();

  @$internal
  @override
  $ProviderElement<AuthState> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthState create(Ref ref) {
    return authState(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthState>(value),
    );
  }
}

String _$authStateHash() => r'039e4a68982ad4a854abc99de28528a6990ce7c6';
