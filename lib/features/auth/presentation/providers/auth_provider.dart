import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/models/result.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/entities/auth_user.dart';
import '../../domain/repositories/auth_repository.dart';

part 'auth_provider.g.dart';

/// Provider for the [AuthRepository] implementation.
@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  // Return the mock implementation for now.
  return MockAuthRepository();
}

/// AuthNotifier manages the current authentication state of the application.
@riverpod
class Auth extends _$Auth {
  @override
  Result<AuthUser?> build() {
    // During build, we can check for an existing session.
    _checkSession();
    return const Loading();
  }

  Future<void> _checkSession() async {
    final repo = ref.read(authRepositoryProvider);
    final result = await repo.getCurrentUser();
    state = result;
  }

  Future<void> login(String email, String password) async {
    state = const Loading();
    final repo = ref.read(authRepositoryProvider);
    final result = await repo.login(email: email, password: password);
    state = result;
  }

  Future<void> register(String email, String password, String username) async {
    state = const Loading();
    final repo = ref.read(authRepositoryProvider);
    final result = await repo.register(
      email: email,
      password: password,
      username: username,
    );
    state = result;
  }

  Future<void> loginAsGuest() async {
    state = const Loading();
    final repo = ref.read(authRepositoryProvider);
    final result = await repo.loginAsGuest();
    state = result;
  }

  Future<void> logout() async {
    final repo = ref.read(authRepositoryProvider);
    await repo.logout();
    state = const Success(null);
  }
}
