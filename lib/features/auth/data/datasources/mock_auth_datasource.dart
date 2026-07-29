import 'auth_datasource.dart';
import '../models/auth_user_dto.dart';
import '../../../../core/errors/app_exception.dart';

class MockAuthenticationDataSource implements AuthenticationDataSource {
  AuthUserDto? _currentUser;

  @override
  Future<AuthUserDto> signIn(String email, String password) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    if (email == 'error@soteria.com') {
      throw const AuthException('Invalid credentials.');
    }
    _currentUser = AuthUserDto(
      id: 'mock_123',
      email: email,
      username: 'ScholarHero',
    );
    return _currentUser!;
  }

  @override
  Future<AuthUserDto> register(String email, String password, String username) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    _currentUser = AuthUserDto(
      id: 'mock_new',
      email: email,
      username: username,
    );
    return _currentUser!;
  }

  @override
  Future<AuthUserDto> signInWithGoogle() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    _currentUser = const AuthUserDto(
      id: 'google_123',
      email: 'google@scholar.com',
      username: 'GoogleScholar',
    );
    return _currentUser!;
  }

  @override
  Future<AuthUserDto> signInWithApple() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    _currentUser = const AuthUserDto(
      id: 'apple_456',
      email: 'apple@scholar.com',
      username: 'AppleScholar',
    );
    return _currentUser!;
  }

  @override
  Future<AuthUserDto> signInWithPhone(String phoneNumber) async {
    await Future<void>.delayed(const Duration(seconds: 2));
    _currentUser = AuthUserDto(
      id: 'phone_789',
      email: 'phone@soteria.app',
      username: 'PhoneUser_$phoneNumber',
    );
    return _currentUser!;
  }

  @override
  Future<AuthUserDto> signInAsGuest() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    _currentUser = const AuthUserDto(
      id: 'guest_456',
      email: 'guest@soteria.app',
      username: 'Guest Scholar',
      isGuest: true,
    );
    return _currentUser!;
  }

  @override
  Future<void> signOut() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    _currentUser = null;
  }

  @override
  Future<AuthUserDto?> getCurrentUser() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    return _currentUser;
  }

  @override
  Future<void> deleteAccount() async {
    _currentUser = null;
  }

  @override
  Future<AuthUserDto> updateProfile({String? username, String? avatarUrl}) async {
    if (_currentUser == null) throw const AuthException('Not signed in.');
    _currentUser = _currentUser!.copyWith(
      username: username ?? _currentUser!.username,
      avatarUrl: avatarUrl ?? _currentUser!.avatarUrl,
    );
    return _currentUser!;
  }

  @override
  Future<bool> checkUsernameAvailability(String username) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    final taken = ['admin', 'soteria'].contains(username.toLowerCase());
    return !taken;
  }

  @override
  Future<void> linkProvider(String providerId) async {
    await Future<void>.delayed(const Duration(seconds: 1));
  }

  @override
  Future<void> unlinkProvider(String providerId) async {
    await Future<void>.delayed(const Duration(seconds: 1));
  }

  // --- Account Recovery Mock ---

  @override
  Future<void> requestPasswordReset(String email) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    if (email == 'notfound@soteria.app') {
      throw const AuthException('Account not found.');
    }
  }

  @override
  Future<void> verifyRecoveryCode(String email, String code) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    // Mock logic: codes starting with 123 are valid.
    if (!code.startsWith('123')) {
      throw const AuthException('Invalid verification code.');
    }
  }

  @override
  Future<void> resetPassword(String email, String newPassword, String code) async {
    await Future<void>.delayed(const Duration(seconds: 1));
  }
}
