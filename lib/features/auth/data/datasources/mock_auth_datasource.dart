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
    // Simple mock logic: 'admin' and 'soteria' are taken.
    final taken = ['admin', 'soteria'].contains(username.toLowerCase());
    return !taken;
  }
}
