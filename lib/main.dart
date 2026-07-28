import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/config/app_config.dart';
import 'core/navigation/app_router.dart';
import 'core/design_system/design_system.dart';
import 'core/services/startup_service.dart';
import 'core/services/ui_service.dart';
import 'core/widgets/loading/soteria_loading.dart';
import 'core/localization/app_localizations.dart';
import 'core/logging/logger.dart';
import 'core/errors/error_handler.dart';
import 'core/performance/startup_metrics.dart';
import 'core/performance/performance_provider.dart';
import 'core/accessibility/accessibility_provider.dart';
import 'core/lifecycle/lifecycle_provider.dart';

void main() async {
  StartupMetrics.markStart();
  
  final logger = SoteriaLogger();
  final errorHandler = ErrorHandler(logger: logger);
  errorHandler.init();

  await errorHandler.runZoned(() async {
    // Ensure bindings are initialized within the protected zone
    WidgetsFlutterBinding.ensureInitialized();
    
    runApp(
      const ProviderScope(
        child: SoteriaApp(),
      ),
    );
  });
}

class SoteriaApp extends ConsumerWidget {
  const SoteriaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startup = ref.watch(appStartupProvider);

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return startup.when(
          data: (config) => ProviderScope(
            overrides: [
              appConfigProvider.overrideWithValue(config),
            ],
            child: const _AppFoundation(
              child: _AppContent(),
            ),
          ),
          loading: () => const _LoadingApp(),
          error: (err, stack) => _ErrorApp(error: err),
        );
      },
    );
  }
}

/// _AppFoundation is responsible for warming up core services and 
/// handling global accessibility settings.
class _AppFoundation extends ConsumerWidget {
  const _AppFoundation({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Initialize Foundation Services
    ref.watch(performanceServiceProvider);
    ref.watch(accessibilityServiceProvider);
    ref.watch(appLifecycleServiceProvider);

    return child;
  }
}

class _AppContent extends ConsumerWidget {
  const _AppContent();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    final locale = ref.watch(localeProvider);
    final isLoading = ref.watch(loadingOverlayProvider);

    return MaterialApp.router(
      title: 'Soteria',
      theme: SoteriaTheme.light,
      darkTheme: SoteriaTheme.dark,
      themeMode: ThemeMode.system,
      locale: locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        ...AppLocalizations.delegates,
      ],
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        // Synchronize Accessibility Service with current MediaQuery
        ref.read(accessibilityServiceProvider).updateFromMediaQuery(
          MediaQuery.of(context),
        );

        // We use a Stack inside the builder to ensure Directionality is available
        // from MaterialApp, solving the "No Directionality widget found" error.
        return Stack(
          children: [
            child ?? const SizedBox.shrink(),
            if (isLoading)
              const Material(
                color: Colors.black26,
                child: Center(
                  child: SoteriaCircularLoader(),
                ),
              ),
          ],
        );
      },
    );
  }
}

class _LoadingApp extends StatelessWidget {
  const _LoadingApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: SoteriaTheme.light,
      home: const Scaffold(
        body: SoteriaCircularLoader(),
      ),
    );
  }
}

class _ErrorApp extends StatelessWidget {
  const _ErrorApp({required this.error});
  final Object error;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: SoteriaTheme.light,
      home: Scaffold(
        body: Center(
          child: Text('Startup Error: $error'),
        ),
      ),
    );
  }
}
