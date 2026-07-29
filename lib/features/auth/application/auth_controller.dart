import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/entities/auth_status.dart';
import '../domain/entities/auth_provider_type.dart';
import '../domain/repositories/auth_repository.dart';
import '../domain/entities/session.dart';
import '../domain/entities/session_status.dart';
import 'auth_state.dart';
import 'session_controller.dart';
import '../../../../core/analytics/analytics_provider.dart';
import '../../../../core/analytics/analytics_event.dart';

part 'auth_controller.g.dart';

/// Notifier that manages the user's authentication state.
@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  late AuthenticationRepository _repository;
  bool _isInitialized = false;

  @override
  AuthState build() {
    _listenToSession();
    return const AuthState();
  }

  void _listenToSession() {
    ref.listen(sessionControllerProvider, (prev, next) {
      state = state.copyWith(
        status: _mapSessionStatus(next.status),
        user: next.user,
      );
    });
  }

  AuthStatus _mapSessionStatus(SessionStatus sessionStatus) {
    return switch (sessionStatus) {
      SessionStatus.restoring => AuthStatus.authenticating,
      SessionStatus.authenticated => AuthStatus.authenticated,
      SessionStatus.guest => AuthStatus.guest,
      SessionStatus.expired => AuthStatus.sessionExpired,
      SessionStatus.locked => AuthStatus.authenticating,
      SessionStatus.loggedOut => AuthStatus.unauthenticated,
      SessionStatus.failure => AuthStatus.error,
    };
  }

  /// Initializes the controller by checking for an active session.
  Future<void> initialize(AuthenticationRepository repository) async {
    if (_isInitialized) return;
    _repository = repository;
    
    await ref.read(sessionControllerProvider.notifier).restoreSession();
    _isInitialized = true;
  }

  Future<void> signIn(String email, String password, {bool rememberMe = false}) async {
    state = state.copyWith(status: AuthStatus.authenticating, isCancelled: false, lastUsedProvider: AuthProviderType.email);
    final result = await _repository.signIn(
      email: email, 
      password: password,
      rememberMe: rememberMe,
    );
    
    if (result.isSuccess) {
      final user = result.dataOrNull!;
      ref.read(sessionControllerProvider.notifier).setSession(Session(
        status: user.isGuest ? SessionStatus.guest : SessionStatus.authenticated,
        user: user,
        rememberMe: rememberMe,
        lastActivityAt: DateTime.now(),
      ));
      await ref.read(analyticsServiceProvider).trackEvent(ButtonClickedEvent('login_success_email'));
    } else {
      state = state.copyWith(status: AuthStatus.unauthenticated, failure: result.failureOrNull);
    }
  }

  Future<void> signInWithGoogle() async {
    state = state.copyWith(status: AuthStatus.authenticating, isCancelled: false, lastUsedProvider: AuthProviderType.google);
    final result = await _repository.signInWithGoogle();

    if (result.isSuccess) {
      final user = result.dataOrNull!;
      ref.read(sessionControllerProvider.notifier).setSession(Session(
        status: SessionStatus.authenticated,
        user: user,
        lastActivityAt: DateTime.now(),
      ));
      await ref.read(analyticsServiceProvider).trackEvent(ButtonClickedEvent('login_success_google'));
    } else {
      state = state.copyWith(status: AuthStatus.unauthenticated, failure: result.failureOrNull);
    }
  }

  Future<void> signInWithApple() async {
    state = state.copyWith(status: AuthStatus.authenticating, isCancelled: false, lastUsedProvider: AuthProviderType.apple);
    final result = await _repository.signInWithApple();

    if (result.isSuccess) {
      final user = result.dataOrNull!;
      ref.read(sessionControllerProvider.notifier).setSession(Session(
        status: SessionStatus.authenticated,
        user: user,
        lastActivityAt: DateTime.now(),
      ));
      await ref.read(analyticsServiceProvider).trackEvent(ButtonClickedEvent('login_success_apple'));
    } else {
      state = state.copyWith(status: AuthStatus.unauthenticated, failure: result.failureOrNull);
    }
  }

  Future<void> signInWithPhone(String phoneNumber) async {
    state = state.copyWith(status: AuthStatus.authenticating, isCancelled: false, lastUsedProvider: AuthProviderType.phone);
    final result = await _repository.signInWithPhone(phoneNumber);

    if (result.isSuccess) {
      final user = result.dataOrNull!;
      ref.read(sessionControllerProvider.notifier).setSession(Session(
        status: SessionStatus.authenticated,
        user: user,
        lastActivityAt: DateTime.now(),
      ));
      await ref.read(analyticsServiceProvider).trackEvent(ButtonClickedEvent('login_success_phone'));
    } else {
      state = state.copyWith(status: AuthStatus.unauthenticated, failure: result.failureOrNull);
    }
  }

  Future<void> signInWithBiometrics() async {
    state = state.copyWith(status: AuthStatus.authenticating, isCancelled: false);
    final result = await _repository.signInWithBiometrics();

    if (result.isSuccess) {
      final user = result.dataOrNull!;
      ref.read(sessionControllerProvider.notifier).setSession(Session(
        status: SessionStatus.authenticated,
        user: user,
        lastActivityAt: DateTime.now(),
      ));
    } else {
      state = state.copyWith(status: AuthStatus.unauthenticated, failure: result.failureOrNull);
    }
  }

  Future<void> register(String email, String password, String username) async {
    state = state.copyWith(status: AuthStatus.authenticating);
    final result = await _repository.register(
      email: email,
      password: password,
      username: username,
    );

    if (result.isSuccess) {
      final user = result.dataOrNull!;
      ref.read(sessionControllerProvider.notifier).setSession(Session(
        status: SessionStatus.authenticated,
        user: user,
        lastActivityAt: DateTime.now(),
      ));
      await ref.read(analyticsServiceProvider).trackEvent(ButtonClickedEvent('register_success'));
    } else {
      state = state.copyWith(status: AuthStatus.unauthenticated, failure: result.failureOrNull);
    }
  }

  Future<void> signInAsGuest() async {
    state = state.copyWith(status: AuthStatus.authenticating, isCancelled: false, lastUsedProvider: AuthProviderType.anonymous);
    final result = await _repository.signInAsGuest();

    if (result.isSuccess) {
      final user = result.dataOrNull!;
      ref.read(sessionControllerProvider.notifier).setSession(Session(
        status: SessionStatus.guest,
        user: user,
        lastActivityAt: DateTime.now(),
      ));
      await ref.read(analyticsServiceProvider).trackEvent(ButtonClickedEvent('login_success_guest'));
    } else {
      state = state.copyWith(status: AuthStatus.unauthenticated, failure: result.failureOrNull);
    }
  }

  Future<void> signOut() async {
    await ref.read(sessionControllerProvider.notifier).logout();
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await _repository.sendPasswordResetEmail(email);
  }
}
