import '../../../../core/models/result.dart';
import '../entities/auth_user.dart';

/// AuthRepository defines the contract for authentication operations.
abstract class AuthRepository {
  /// Signs in a user with email and password.
  Future<Result<AuthUser>> login({
    required String email,
    required String password,
  });

  /// Registers a new user.
  Future<Result<AuthUser>> register({
    required String email,
    required String password,
    required String username,
  });

  /// Signs in as a guest user.
  Future<Result<AuthUser>> loginAsGuest();

  /// Logs out the current user.
  Future<Result<void>> logout();

  /// Retrieves the currently authenticated user if one exists.
  Future<Result<AuthUser?>> getCurrentUser();
}
