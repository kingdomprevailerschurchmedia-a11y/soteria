import '../../../../core/models/result.dart';
import '../entities/auth_user.dart';
import '../entities/auth_session.dart';

/// AuthenticationRepository defines the domain-level contract for identity management.
abstract class AuthenticationRepository {
  /// Signs in a user using email and password.
  Future<Result<AuthUser>> signIn({
    required String email,
    required String password,
    bool rememberMe = false,
  });

  /// Registers a new user with email, password, and username.
  Future<Result<AuthUser>> register({
    required String email,
    required String password,
    required String username,
  });

  /// Signs in using biometric authentication if available and configured.
  Future<Result<AuthUser>> signInWithBiometrics();

  /// Signs in as a temporary guest user.
  Future<Result<AuthUser>> signInAsGuest();

  /// Ends the current user session and clears all identity tokens.
  Future<Result<void>> signOut();

  /// Refreshes the current authentication session using a refresh token.
  Future<Result<AuthSession>> refreshSession();

  /// Returns the current user profile if authenticated.
  Future<Result<AuthUser?>> currentUser();

  /// Returns true if there is a valid active session.
  Future<bool> isAuthenticated();

  /// Permanently deletes the user's account and data.
  Future<Result<void>> deleteAccount();

  /// Updates the current user's profile information.
  Future<Result<AuthUser>> updateProfile({
    String? username,
    String? avatarUrl,
  });

  /// Checks if a username is already taken.
  Future<Result<bool>> checkUsernameAvailability(String username);

  /// Triggers the password reset flow for the given email.
  Future<Result<void>> sendPasswordResetEmail(String email);
}
