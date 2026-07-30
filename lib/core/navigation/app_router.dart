import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/practice/practice_screen.dart';
import '../../features/versus/versus_screen.dart';
import '../../features/leaderboard/leaderboard_screen.dart';
import '../../features/profile/profile_screen.dart';
import '../../features/developer_preview/presentation/screens/preview_gallery_screen.dart';
import '../../features/developer_dashboard/presentation/screens/developer_dashboard_screen.dart';
import '../../features/developer_dashboard/presentation/screens/log_viewer_screen.dart';
import '../../features/developer_dashboard/presentation/screens/feature_flags_screen.dart';
import '../../features/developer_dashboard/presentation/screens/analytics_screen.dart';
import '../../features/developer_dashboard/presentation/screens/performance_screen.dart';
import '../../features/developer_dashboard/presentation/screens/accessibility_screen.dart';
import '../../features/developer_dashboard/presentation/screens/validation_screen.dart';
import '../../features/game_rules/presentation/screens/rules_dashboard_screen.dart';
import '../../features/auth/presentation/providers/auth_providers.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/social_login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/auth/presentation/screens/forgot_password_screen.dart';
import '../../features/auth/presentation/screens/verify_code_screen.dart';
import '../../features/auth/presentation/screens/reset_password_screen.dart';
import '../../features/auth/presentation/screens/recovery_success_screen.dart';
import '../../features/auth/application/session_controller.dart';
import '../../features/auth/domain/entities/session_status.dart';
import '../../features/onboarding/presentation/providers/onboarding_provider.dart';
import '../../features/onboarding/presentation/providers/splash_provider.dart';
import '../../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../../features/personalization/presentation/providers/personalization_provider.dart';
import '../../features/personalization/presentation/screens/personalization_screen.dart';
import '../widgets/splash_screen.dart';
import 'app_shell.dart';
import 'navigation_constants.dart';
import 'refresh_notifier.dart';
import 'analytics_observer.dart';
import 'application/navigation_controller.dart';
import '../analytics/analytics_provider.dart';
import '../services/initialization_service.dart';

/// Global key for the root navigator.
final rootNavigatorKey = GlobalKey<NavigatorState>();

/// appRouterProvider provides the GoRouter configuration with Auth Guards.
final appRouterProvider = Provider<GoRouter>((ref) {
  final auth = ref.watch(authStateProvider);
  final session = ref.watch(sessionControllerProvider);
  final isOnboardingCompleted = ref.watch(onboardingProvider);
  final personalizationState = ref.watch(personalizationProvider);
  final isSplashCompleted = ref.watch(splashStateProvider);
  final isInitialized = ref.watch(appInitializationServiceProvider);
  final analytics = ref.watch(analyticsServiceProvider);

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: NavigationConstants.splash,
    debugLogDiagnostics: kDebugMode,
    observers: [AnalyticsObserver(analytics)],
    
    refreshListenable: RefreshNotifier(
      Listenable.merge([]),
    ),
    
    redirect: (context, state) {
      final isSplash = state.matchedLocation == NavigationConstants.splash;
      final isAuth = state.matchedLocation == NavigationConstants.login || 
                    state.matchedLocation == NavigationConstants.register;
      final isOnboarding = state.matchedLocation == NavigationConstants.onboarding;
      final isPersonalization = state.matchedLocation == NavigationConstants.personalization;

      // 1. Force stay on splash until animations AND background init complete
      if (!isSplashCompleted || !isInitialized) {
        return isSplash ? null : NavigationConstants.splash;
      }

      // 2. Handle Session Expiration
      if (session.status == SessionStatus.expired) {
        return isAuth ? null : NavigationConstants.login;
      }

      // 3. Auth Initializing / Restoring
      if (session.status == SessionStatus.restoring) return null;

      // 4. Not logged in
      if (!auth.isAuthenticated) {
        if (!isOnboardingCompleted) {
          return isOnboarding ? null : NavigationConstants.onboarding;
        }
        if (!personalizationState.isCompleted) {
          return isPersonalization ? null : NavigationConstants.personalization;
        }
        return isAuth ? null : NavigationConstants.login;
      }

      // 5. Logged in - avoid auth/onboarding screens
      if (isSplash || isAuth || isOnboarding || isPersonalization) {
        return NavigationConstants.home;
      }

      return null;
    },

    routes: [
      GoRoute(
        path: NavigationConstants.splash,
        name: NavigationConstants.splashName,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: NavigationConstants.onboarding,
        name: NavigationConstants.onboardingName,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: NavigationConstants.personalization,
        name: NavigationConstants.personalizationName,
        builder: (context, state) => const PersonalizationScreen(),
      ),
      GoRoute(
        path: NavigationConstants.login,
        name: NavigationConstants.loginName,
        builder: (context, state) => const SocialLoginScreen(),
        routes: [
          GoRoute(
            path: 'email',
            name: 'login-email',
            builder: (context, state) => const LoginScreen(),
          ),
        ],
      ),
      GoRoute(
        path: NavigationConstants.register,
        name: NavigationConstants.registerName,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: NavigationConstants.forgotPassword,
        name: NavigationConstants.forgotPasswordName,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: NavigationConstants.verifyRecovery,
        name: NavigationConstants.verifyRecoveryName,
        builder: (context, state) => const VerifyCodeScreen(),
      ),
      GoRoute(
        path: NavigationConstants.resetPassword,
        name: NavigationConstants.resetPasswordName,
        builder: (context, state) => const ResetPasswordScreen(),
      ),
      GoRoute(
        path: NavigationConstants.recoverySuccess,
        name: NavigationConstants.recoverySuccessName,
        builder: (context, state) => const RecoverySuccessScreen(),
      ),

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          // Synchronize NavigationController with shell index
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ref.read(navigationControllerProvider.notifier).setIndex(navigationShell.currentIndex);
          });
          return AppShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: NavigationConstants.home,
                name: NavigationConstants.homeName,
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: NavigationConstants.practice,
                name: NavigationConstants.practiceName,
                builder: (context, state) => const PracticeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: NavigationConstants.versus,
                name: NavigationConstants.versusName,
                builder: (context, state) => const VersusScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: NavigationConstants.leaderboard,
                name: NavigationConstants.leaderboardName,
                builder: (context, state) => const LeaderboardScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: NavigationConstants.profile,
                name: NavigationConstants.profileName,
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
      
      // Separate branch for Debug/Developer Dashboard (accessible from profile or deep link)
      GoRoute(
        path: NavigationConstants.debug,
        name: NavigationConstants.debugName,
        builder: (context, state) => const DeveloperDashboardScreen(),
        routes: [
          GoRoute(
            path: NavigationConstants.gallery,
            name: NavigationConstants.galleryName,
            builder: (context, state) => const PreviewGalleryScreen(),
          ),
          GoRoute(
            path: NavigationConstants.logs,
            name: NavigationConstants.logsName,
            builder: (context, state) => const LogViewerScreen(),
          ),
          GoRoute(
            path: NavigationConstants.featureFlags,
            name: NavigationConstants.featureFlagsName,
            builder: (context, state) => const FeatureFlagSettingsScreen(),
          ),
          GoRoute(
            path: NavigationConstants.analytics,
            name: NavigationConstants.analyticsName,
            builder: (context, state) => const AnalyticsDashboardScreen(),
          ),
          GoRoute(
            path: NavigationConstants.performance,
            name: NavigationConstants.performanceName,
            builder: (context, state) => const PerformanceDashboardScreen(),
          ),
          GoRoute(
            path: NavigationConstants.accessibility,
            name: NavigationConstants.accessibilityName,
            builder: (context, state) => const AccessibilityDashboardScreen(),
          ),
          GoRoute(
            path: NavigationConstants.validation,
            name: NavigationConstants.validationName,
            builder: (context, state) => const ValidationDashboardScreen(),
          ),
          GoRoute(
            path: NavigationConstants.gameRules,
            name: NavigationConstants.gameRulesName,
            builder: (context, state) => const RulesDashboardScreen(),
          ),
        ],
      ),
    ],
  );
});
