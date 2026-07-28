import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../config/app_config.dart';
import '../logging/logger_provider.dart';
import '../feature_flags/feature_flag_provider.dart';
import '../analytics/analytics_provider.dart';
import '../analytics/analytics_registry.dart';
import '../performance/startup_metrics.dart';
import '../../features/onboarding/presentation/providers/onboarding_provider.dart';
import '../../features/personalization/presentation/providers/personalization_provider.dart';
import '../../features/auth/presentation/providers/auth_providers.dart';
import '../../features/auth/application/auth_controller.dart';

/// Provider that handles the application startup logic.
/// It initializes all required services before the app is fully ready.
final appStartupProvider = FutureProvider<AppConfig>((ref) async {
  // 1. Initialize SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  
  // 2. Initialize Feature Flags
  await ref.read(featureFlagsProvider.notifier).initialize(prefs);

  // 3. Initialize Analytics
  final analytics = ref.read(analyticsServiceProvider);
  await analytics.initialize();
  await AnalyticsRegistry.registerDefaultProperties(analytics);

  // 4. Initialize Personalization
  await ref.read(personalizationProvider.notifier).initialize(prefs);

  // 5. Initialize Authentication
  final authRepo = ref.read(authenticationRepositoryProvider);
  await ref.read(authControllerProvider.notifier).initialize(authRepo);

  // 6. Load Onboarding state
  final onboardingCompleted = prefs.getBool('onboarding_completed') ?? false;
  ref.read(onboardingProvider.notifier).setCompleted(onboardingCompleted);

  // 5. Load Environment Variables
  // In a real app, we might check an env-specific entry point,
  // but here we default to .env.dev for initial foundation.
  await dotenv.load(fileName: ".env.dev");

  // 6. Get Package Info
  final packageInfo = await PackageInfo.fromPlatform();

  // 7. Create AppConfig
  final config = AppConfig(
    appName: dotenv.get('APP_NAME', fallback: 'Soteria'),
    version: '${packageInfo.version}+${packageInfo.buildNumber}',
    environment: _getEnvironment(dotenv.get('ENV', fallback: 'dev')),
    apiBaseUrl: dotenv.get('API_URL'),
    enableAnalytics: dotenv.get('ENABLE_ANALYTICS', fallback: 'false') == 'true',
    enableLogging: dotenv.get('ENABLE_LOGGING', fallback: 'true') == 'true',
    enableCrashReporting: dotenv.get('ENABLE_CRASH_REPORTING', fallback: 'false') == 'true',
  );

  // 8. Use the centralized logger
  final logger = ref.read(loggerProvider);
  logger.info('App started in ${config.environment.name} mode, version ${config.version}');

  // 9. Mark startup as complete
  StartupMetrics.markReady();

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
