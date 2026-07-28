import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/entities/auth_status.dart';
import '../domain/repositories/auth_repository.dart';
import 'auth_state.dart';
import '../../../../core/analytics/analytics_provider.dart';
import '../../../../core/analytics/analytics_event.dart';

part 'auth_controller.g.dart';

/// Notifier that manages the user's authentication state.
@riverpod
class AuthController extends _$AuthController {
  late AuthenticationRepository _repository;
  bool _isInitialized = false;

  @override
  AuthState build() {
    return const AuthState();
  }

  /// Initializes the controller by checking for an active session.
  Future<void> initialize(AuthenticationRepository repository) async {
    if (_isInitialized) return;

    _repository = repository;
    state = state.copyWith(status: AuthStatus.authenticating);
    
    final result = await _repository.currentUser();
    
    if (result.isSuccess) {
      final user = result.dataOrNull;
      if (user != null) {
        state = state.copyWith(
          status: user.isGuest ? AuthStatus.guest : AuthStatus.authenticated,
          user: user,
        );
      } else {
        state = state.copyWith(status: AuthStatus.unauthenticated);
      }
    } else {
      state = state.copyWith(status: AuthStatus.unauthenticated, failure: result.failureOrNull);
    }
    _isInitialized = true;
  }

  Future<void> signIn(String email, String password, {bool rememberMe = false}) async {
    state = state.copyWith(status: AuthStatus.authenticating);
    final result = await _repository.signIn(
      email: email, 
      password: password,
      rememberMe: rememberMe,
    );
    
    if (result.isSuccess) {
      state = state.copyWith(status: AuthStatus.authenticated, user: result.dataOrNull);
      await ref.read(analyticsServiceProvider).trackEvent(ButtonClickedEvent('login_success'));
    } else {
      state = state.copyWith(status: AuthStatus.unauthenticated, failure: result.failureOrNull);
    }
  }

  Future<void> signInWithBiometrics() async {
    state = state.copyWith(status: AuthStatus.authenticating);
    final result = await _repository.signInWithBiometrics();

    if (result.isSuccess) {
      state = state.copyWith(status: AuthStatus.authenticated, user: result.dataOrNull);
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
      state = state.copyWith(status: AuthStatus.authenticated, user: result.dataOrNull);
      await ref.read(analyticsServiceProvider).trackEvent(ButtonClickedEvent('register_success'));
    } else {
      state = state.copyWith(status: AuthStatus.unauthenticated, failure: result.failureOrNull);
    }
  }

  Future<void> signInAsGuest() async {
    state = state.copyWith(status: AuthStatus.authenticating);
    final result = await _repository.signInAsGuest();

    if (result.isSuccess) {
      state = state.copyWith(status: AuthStatus.guest, user: result.dataOrNull);
    } else {
      state = state.copyWith(status: AuthStatus.unauthenticated, failure: result.failureOrNull);
    }
  }

  Future<void> signOut() async {
    await _repository.signOut();
    state = const AuthState(status: AuthStatus.unauthenticated);
    await ref.read(analyticsServiceProvider).trackEvent(ButtonClickedEvent('logout'));
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await _repository.sendPasswordResetEmail(email);
  }
}
