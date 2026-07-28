import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// SecureStorageService provides an encrypted key-value store for sensitive data.
class SecureStorageService {
  const SecureStorageService(this._storage);
  final FlutterSecureStorage _storage;

  static const String _tokenKey = 'soteria_access_token';
  static const String _refreshKey = 'soteria_refresh_token';
  static const String _userKey = 'soteria_user_data';

  /// Saves the access token.
  Future<void> saveAccessToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  /// Retrieves the access token.
  Future<String?> getAccessToken() async {
    return _storage.read(key: _tokenKey);
  }

  /// Saves the refresh token.
  Future<void> saveRefreshToken(String token) async {
    await _storage.write(key: _refreshKey, value: token);
  }

  /// Retrieves the refresh token.
  Future<String?> getRefreshToken() async {
    return _storage.read(key: _refreshKey);
  }

  /// Saves encrypted user JSON data.
  Future<void> saveUserData(String json) async {
    await _storage.write(key: _userKey, value: json);
  }

  /// Retrieves encrypted user JSON data.
  Future<String?> getUserData() async {
    return _storage.read(key: _userKey);
  }

  /// Clears all authentication data.
  Future<void> clearAuthData() async {
    await _storage.delete(key: _tokenKey);
    await _storage.delete(key: _refreshKey);
    await _storage.delete(key: _userKey);
  }
}

/// Provider for the [SecureStorageService].
final secureStorageProvider = Provider<SecureStorageService>((ref) {
  return const SecureStorageService(FlutterSecureStorage());
});
