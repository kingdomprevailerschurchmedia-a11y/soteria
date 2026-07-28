import 'package:flutter_riverpod/flutter_riverpod.dart';

/// AppEnvironment defines the possible environments the app can run in.
enum AppEnvironment {
  development,
  staging,
  production,
}

/// AppConfig holds the application-wide configuration.
class AppConfig {
  const AppConfig({
    required this.appName,
    required this.version,
    required this.environment,
    required this.apiBaseUrl,
    required this.enableAnalytics,
    required this.enableLogging,
    required this.enableCrashReporting,
  });

  final String appName;
  final String version;
  final AppEnvironment environment;
  final String apiBaseUrl;
  final bool enableAnalytics;
  final bool enableLogging;
  final bool enableCrashReporting;

  /// Returns true if the environment is development.
  bool get isDevelopment => environment == AppEnvironment.development;

  /// Returns true if the environment is staging.
  bool get isStaging => environment == AppEnvironment.staging;

  /// Returns true if the environment is production.
  bool get isProduction => environment == AppEnvironment.production;
}

/// Provider for the [AppConfig].
/// This will be overridden during app startup.
final appConfigProvider = Provider<AppConfig>((ref) {
  throw UnimplementedError('appConfigProvider must be overridden');
});
