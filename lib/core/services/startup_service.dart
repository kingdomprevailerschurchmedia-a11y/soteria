import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../config/app_config.dart';
import 'logger_service.dart';
import '../../features/onboarding/presentation/providers/onboarding_provider.dart';

/// Provider that handles the application startup logic.
/// It initializes all required services before the app is fully ready.
final appStartupProvider = FutureProvider<AppConfig>((ref) async {
  // 1. Initialize SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  
  // 2. Load Onboarding state
  final onboardingCompleted = prefs.getBool('onboarding_completed') ?? false;
  ref.read(onboardingProvider.notifier).setCompleted(onboardingCompleted);

  // 3. Load Environment Variables
  // In a real app, we might check an env-specific entry point,
  // but here we default to .env.dev for initial foundation.
  await dotenv.load(fileName: ".env.dev");

  // 3. Get Package Info
  final packageInfo = await PackageInfo.fromPlatform();

  // 4. Create AppConfig
  final config = AppConfig(
    appName: dotenv.get('APP_NAME', fallback: 'Soteria'),
    version: '${packageInfo.version}+${packageInfo.buildNumber}',
    environment: _getEnvironment(dotenv.get('ENV', fallback: 'dev')),
    apiBaseUrl: dotenv.get('API_URL'),
    enableAnalytics: dotenv.get('ENABLE_ANALYTICS', fallback: 'false') == 'true',
    enableLogging: dotenv.get('ENABLE_LOGGING', fallback: 'true') == 'true',
    enableCrashReporting: dotenv.get('ENABLE_CRASH_REPORTING', fallback: 'false') == 'true',
    featureFlags: {}, // Load feature flags if any
  );

  // 5. Initialize Logger with config
  final logger = SoteriaLogger(enableLogging: config.enableLogging);
  ref.read(loggerProvider); // Ensure logger is initialized

  logger.info('App started in ${config.environment.name} mode, version ${config.version}');

  return config;
});

AppEnvironment _getEnvironment(String env) {
  switch (env.toLowerCase()) {
    case 'prod':
    case 'production':
      return AppEnvironment.production;
    case 'staging':
      return AppEnvironment.staging;
    default:
      return AppEnvironment.development;
  }
}
