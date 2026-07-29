import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../config/app_config.dart';
import '../logging/logger_provider.dart';

part 'startup_service.g.dart';

/// Provides the SharedPreferences instance after it has been initialized in main().
@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(Ref ref) {
  throw UnimplementedError('Override sharedPreferencesProvider in the Root ProviderScope');
}

/// Provides the PackageInfo instance after it has been initialized in main().
@Riverpod(keepAlive: true)
PackageInfo packageInfo(Ref ref) {
  throw UnimplementedError('Override packageInfoProvider in the Root ProviderScope');
}

/// Provider that handles secondary application startup logic (like DotEnv).
@Riverpod(keepAlive: true)
Future<AppConfig> appStartup(Ref ref) async {
  // 1. Parallelize secondary I/O
  await dotenv.load(fileName: ".env.dev");

  final packageInfo = ref.read(packageInfoProvider);

  // 2. Create AppConfig
  final config = AppConfig(
    appName: dotenv.get('APP_NAME', fallback: 'Soteria'),
    version: '${packageInfo.version}+${packageInfo.buildNumber}',
    environment: _getEnvironment(dotenv.get('ENV', fallback: 'dev')),
    apiBaseUrl: dotenv.get('API_URL'),
    enableAnalytics: dotenv.get('ENABLE_ANALYTICS', fallback: 'false') == 'true',
    enableLogging: dotenv.get('ENABLE_LOGGING', fallback: 'true') == 'true',
    enableCrashReporting: dotenv.get('ENABLE_CRASH_REPORTING', fallback: 'false') == 'true',
  );

  // 3. Log startup event
  final logger = ref.read(loggerProvider);
  logger.info('App Startup completed. Environment: ${config.environment.name}', tag: 'System');

  return config;
}

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
