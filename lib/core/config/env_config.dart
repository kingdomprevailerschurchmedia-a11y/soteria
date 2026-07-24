import 'package:flutter_dotenv/flutter_dotenv.dart';

/// EnvConfig handles the loading and retrieval of environment variables.
class EnvConfig {
  /// Initializes the environment configuration.
  static Future<void> init({required String fileName}) async {
    await dotenv.load(fileName: fileName);
  }

  /// Retrieves the application name from environment variables.
  static String get appName => dotenv.get('APP_NAME', fallback: 'Soteria');

  /// Retrieves the API URL from environment variables.
  static String get apiUrl => dotenv.get('API_URL');

  /// Returns true if the application is in debug mode.
  static bool get isDebug => dotenv.get('DEBUG', fallback: 'false') == 'true';
}
