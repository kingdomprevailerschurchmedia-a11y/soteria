import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/services/secure_storage_service.dart';
import '../../domain/entities/auth_token.dart';

/// SessionLocalDataSource handles persistence of session metadata and tokens.
class SessionLocalDataSource {
  SessionLocalDataSource(this._prefs, this._secureStorage);
  final SharedPreferences _prefs;
  final SecureStorageService _secureStorage;

  static const String _sessionStatusKey = 'soteria_session_status';
  static const String _lastActivityKey = 'soteria_last_activity';
  static const String _rememberMeKey = 'soteria_remember_me';

  /// Saves the current session status.
  Future<void> saveSessionStatus(String status) async {
    await _prefs.setString(_sessionStatusKey, status);
  }

  /// Retrieves the saved session status.
  String? getSessionStatus() {
    return _prefs.getString(_sessionStatusKey);
  }

  /// Saves the timestamp of the last user activity.
  Future<void> saveLastActivity(DateTime timestamp) async {
    await _prefs.setString(_lastActivityKey, timestamp.toIso8601String());
  }

  /// Retrieves the last activity timestamp.
  DateTime? getLastActivity() {
    final string = _prefs.getString(_lastActivityKey);
    return string != null ? DateTime.tryParse(string) : null;
  }

  /// Saves the Remember Me preference.
  Future<void> saveRememberMe(bool value) async {
    await _prefs.setBool(_rememberMeKey, value);
  }

  /// Retrieves the Remember Me preference.
  bool getRememberMe() {
    return _prefs.getBool(_rememberMeKey) ?? false;
  }

  /// Securely saves the authentication token.
  Future<void> saveToken(AuthToken token) async {
    await _secureStorage.saveAccessToken(token.accessToken);
    if (token.refreshToken != null) {
      await _secureStorage.saveRefreshToken(token.refreshToken!);
    }
    // We also store expiration info in prefs as it's not strictly "secret" 
    // but helps with quick expiration checks without decrypting storage.
    await _prefs.setString('soteria_token_expiry', token.expiresAt.toIso8601String());
  }

  /// Securely retrieves the authentication token.
  Future<AuthToken?> getToken() async {
    final access = await _secureStorage.getAccessToken();
    final refresh = await _secureStorage.getRefreshToken();
    final expiryStr = _prefs.getString('soteria_token_expiry');
    
    if (access == null || expiryStr == null) return null;
    
    final expiry = DateTime.tryParse(expiryStr);
    if (expiry == null) return null;

    return AuthToken(
      accessToken: access,
      expiresAt: expiry,
      refreshToken: refresh,
    );
  }

  /// Clears all session data.
  Future<void> clearSession() async {
    await _prefs.remove(_sessionStatusKey);
    await _prefs.remove(_lastActivityKey);
    await _prefs.remove('soteria_token_expiry');
    await _secureStorage.clearAuthData();
  }
}
