import 'dart:async';
import '../../../../core/models/result.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/auth_user.dart';
import '../../domain/repositories/auth_repository.dart';

/// MockAuthRepository implements the [AuthRepository] for development and testing.
/// It simulates network delays and API Spec behaviors.
class MockAuthRepository implements AuthRepository {
  AuthUser? _currentUser;

  @override
  Future<Result<AuthUser>> login({
    required String email,
    required String password,
  }) async {
    await Future<void>.delayed(const Duration(seconds: 2));

    if (email == 'error@soteria.com') {
      return const Failure(AuthenticationFailure('Invalid credentials'));
    }

    _currentUser = AuthUser(
      id: 'mock-uuid-123',
      email: email,
      username: email.split('@')[0],
    );

    return Success(_currentUser!);
  }

  @override
  Future<Result<AuthUser>> register({
    required String email,
    required String password,
    required String username,
  }) async {
    await Future<void>.delayed(const Duration(seconds: 2));

    _currentUser = AuthUser(
      id: 'mock-uuid-register',
      email: email,
      username: username,
    );

    return Success(_currentUser!);
  }

  @override
  Future<Result<AuthUser>> loginAsGuest() async {
    await Future<void>.delayed(const Duration(seconds: 1));

    _currentUser = const AuthUser(
      id: 'guest-uuid',
      email: 'guest@soteria.app',
      username: 'Guest Explorer',
      isGuest: true,
    );

    return Success(_currentUser!);
  }

  @override
  Future<Result<void>> logout() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    _currentUser = null;
    return const Success(null);
  }

  @override
  Future<Result<AuthUser?>> getCurrentUser() async {
    // Check local storage / session here in real impl
    return Success(_currentUser);
  }
}
