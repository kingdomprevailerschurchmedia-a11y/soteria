import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/home/home_screen.dart';
import '../../features/profile/profile_screen.dart';
import '../../features/settings/settings_screen.dart';
import '../../features/developer_preview/gallery_screen.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/onboarding/presentation/providers/onboarding_provider.dart';
import '../../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../widgets/splash_screen.dart';
import '../widgets/app_shell.dart';
import 'route_constants.dart';

import 'refresh_notifier.dart';

/// Global key for the root navigator.
final rootNavigatorKey = GlobalKey<NavigatorState>();

/// appRouterProvider provides the GoRouter configuration with Auth Guards.
final appRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);
  final isOnboardingCompleted = ref.watch(onboardingProvider);

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/splash',
    debugLogDiagnostics: kDebugMode,
    
    // Connect Riverpod to GoRouter for reactive redirects
    refreshListenable: RefreshNotifier(
      Listenable.merge([
        // Convert auth notifier to a listenable if needed, 
        // or just use the fact that the provider rebuilds the router.
        // Actually, in GoRouter 13+, if the provider that provides 
        // GoRouter watches other providers, GoRouter is recreated, 
        // which is often enough. But refreshListenable is safer for
        // fine-grained state changes within a notifier.
      ]),
    ),
    
    // Redirect logic for Auth and Onboarding guards
    redirect: (context, state) {
      final isSplash = state.matchedLocation == '/splash';
      final isAuth = state.matchedLocation == '/login' || state.matchedLocation == '/register';
      final isOnboarding = state.matchedLocation == '/onboarding';

      // 1. If still loading initial session, stay on splash
      if (authState.isLoading) return null;

      final user = authState.dataOrNull;

      // 2. Not logged in
      if (user == null) {
        if (!isOnboardingCompleted) {
          return isOnboarding ? null : '/onboarding';
        }
        return isAuth ? null : '/login';
      }

      // 3. Logged in - avoid auth/onboarding screens
      if (isSplash || isAuth || isOnboarding) {
        return '/';
      }

      return null;
    },

    routes: [
      GoRoute(
        path: '/splash',
        name: RouteConstants.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        name: RouteConstants.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/login',
        name: RouteConstants.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        name: RouteConstants.register,
        builder: (context, state) => const RegisterScreen(),
      ),

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/',
                name: RouteConstants.home,
                builder: (context, state) => const HomeScreen(),
                routes: [
                  if (kDebugMode)
                    GoRoute(
                      path: 'gallery',
                      name: RouteConstants.gallery,
                      builder: (context, state) => const GalleryScreen(),
                    ),
                  GoRoute(
                    path: 'settings',
                    name: RouteConstants.settings,
                    builder: (context, state) => const SettingsScreen(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/practice',
                name: RouteConstants.practice,
                builder: (context, state) => const Scaffold(
                  body: Center(child: Text('Practice Placeholder')),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/versus',
                name: RouteConstants.versus,
                builder: (context, state) => const Scaffold(
                  body: Center(child: Text('Versus Placeholder')),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                name: RouteConstants.profile,
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
