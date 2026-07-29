import '../models/auth_user_dto.dart';

/// AuthenticationDataSource defines the remote/local methods for auth.
/// This interface will be implemented by Firebase or REST data sources.
abstract class AuthenticationDataSource {
  Future<AuthUserDto> signIn(String email, String password);
  Future<AuthUserDto> register(String email, String password, String username);
  Future<AuthUserDto> signInWithGoogle();
  Future<AuthUserDto> signInWithApple();
  Future<AuthUserDto> signInWithPhone(String phoneNumber);
  Future<AuthUserDto> signInAsGuest();
  Future<void> signOut();
  Future<AuthUserDto?> getCurrentUser();
  Future<void> deleteAccount();
  Future<AuthUserDto> updateProfile({String? username, String? avatarUrl});
  Future<bool> checkUsernameAvailability(String username);
  Future<void> linkProvider(String providerId);
  Future<void> unlinkProvider(String providerId);

  // --- Account Recovery ---
  Future<void> requestPasswordReset(String email);
  Future<void> verifyRecoveryCode(String email, String code);
  Future<void> resetPassword(String email, String newPassword, String code);
}
