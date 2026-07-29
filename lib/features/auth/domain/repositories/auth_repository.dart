import '../../../../core/models/result.dart';
import '../entities/auth_user.dart';
import '../entities/auth_session.dart';
import '../entities/auth_provider_type.dart';
import '../entities/session.dart';

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

  /// Signs in using Google.
  Future<Result<AuthUser>> signInWithGoogle();

  /// Signs in using Apple.
  Future<Result<AuthUser>> signInWithApple();

  /// Signs in using Phone Number.
  Future<Result<AuthUser>> signInWithPhone(String phoneNumber);

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

  /// Links a social provider to the current account.
  Future<Result<void>> linkProvider(AuthProviderType type);

  /// Unlinks a social provider from the current account.
  Future<Result<void>> unlinkProvider(AuthProviderType type);

  /// Migrates guest data to a permanent account.
  Future<Result<void>> migrateGuestData();

  // --- Session Management Extensions ---

  /// Restores the session from local storage.
  Future<Result<Session?>> restoreSession();

  /// Persists the session state to local storage.
  Future<Result<void>> persistSession(Session session);

  /// Clears the stored session data.
  Future<Result<void>> clearSession();

  /// Returns true if the current session is valid.
  Future<bool> isSessionValid();

  /// Upgrades a guest session to a full account.
  Future<Result<AuthUser>> upgradeGuestSession({
    required String email,
    required String password,
    required String username,
  });

  // --- Account Recovery Extensions ---

  /// Triggers the password reset flow for the given email.
  Future<Result<void>> requestPasswordReset(String email);

  /// Verifies the code sent during the recovery process.
  Future<Result<void>> verifyRecoveryCode({
    required String email,
    required String code,
  });

  /// Resets the password after successful code verification.
  Future<Result<void>> resetPassword({
    required String email,
    required String newPassword,
    required String verificationCode,
  });

  /// Resends the recovery code.
  Future<Result<void>> resendRecoveryCode(String email);

  /// Standard method for sending password reset email (compat).
  Future<Result<void>> sendPasswordResetEmail(String email);
}
