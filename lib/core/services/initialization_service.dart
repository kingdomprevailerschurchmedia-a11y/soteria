import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'startup_service.dart';
import '../analytics/analytics_provider.dart';
import '../analytics/analytics_registry.dart';
import '../feature_flags/feature_flag_provider.dart';
import '../../../features/auth/presentation/providers/auth_providers.dart';
import '../../../features/auth/application/auth_controller.dart';
import '../../../features/auth/application/guest_controller.dart';
import '../../../features/personalization/presentation/providers/personalization_provider.dart';
import '../../../features/onboarding/presentation/providers/onboarding_provider.dart';
import '../performance/startup_metrics.dart';
import '../logging/logger_provider.dart';

part 'initialization_service.g.dart';

/// AppInitializationService coordinates the background "warming" of foundation services
/// to reduce startup jank and keep the main initialization path as lean as possible.
@Riverpod(keepAlive: true)
class AppInitializationService extends _$AppInitializationService {
  @override
  bool build() => false;

  /// Performs background initialization of non-critical services.
  Future<void> performBackgroundInit() async {
    if (state) return; // Already initialized

    final logger = ref.read(loggerProvider);
    logger.info('Starting background service initialization...', tag: 'System');

    final prefs = ref.read(sharedPreferencesProvider);
    final packageInfo = ref.read(packageInfoProvider);

    // 1. Parallelize core provider initializations
    await Future.wait([
      _initFeatureFlags(prefs),
      _initAnalytics(packageInfo),
      _initPersonalization(prefs),
      _initAuth(),
      _initGuest(),
    ]);

    // 2. Load Onboarding state
    final onboardingCompleted = prefs.getBool('onboarding_completed') ?? false;
    ref.read(onboardingProvider.notifier).setCompleted(onboardingCompleted);

    if (!ref.mounted) return;
    state = true;
    StartupMetrics.markReady();
    logger.info('Background initialization complete.', tag: 'System');
  }

  Future<void> _initFeatureFlags(SharedPreferences prefs) async {
    await ref.read(featureFlagsProvider.notifier).initialize(prefs);
  }

  Future<void> _initAnalytics(PackageInfo packageInfo) async {
    final analytics = ref.read(analyticsServiceProvider);
    await analytics.initialize();
    await AnalyticsRegistry.registerDefaultProperties(analytics);
  }

  Future<void> _initPersonalization(SharedPreferences prefs) async {
    await ref.read(personalizationProvider.notifier).initialize(prefs);
  }

  Future<void> _initAuth() async {
    final authRepo = ref.read(authenticationRepositoryProvider);
    await ref.read(authControllerProvider.notifier).initialize(authRepo);
  }

  Future<void> _initGuest() async {
    final guestRepo = ref.read(guestRepositoryProvider);
    await ref.read(guestControllerProvider.notifier).initialize(guestRepo);
  }
}
