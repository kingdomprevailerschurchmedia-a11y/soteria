import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'core/config/app_config.dart';
import 'core/navigation/app_router.dart';
import 'core/design_system/design_system.dart';
import 'core/services/startup_service.dart';
import 'core/services/initialization_service.dart';
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
  
  // 1. Core Binding & Error Handling
  final logger = SoteriaLogger();
  final errorHandler = ErrorHandler(logger: logger);
  errorHandler.init();

  await errorHandler.runZoned(() async {
    WidgetsFlutterBinding.ensureInitialized();
    
    // 2. Critical Parallel Initialization (Sync bottlenecks)
    final results = await Future.wait([
      SharedPreferences.getInstance(),
      PackageInfo.fromPlatform(),
    ]);

    final prefs = results[0] as SharedPreferences;
    final packageInfo = results[1] as PackageInfo;

    runApp(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          packageInfoProvider.overrideWithValue(packageInfo),
        ],
        child: const SoteriaApp(),
      ),
    );
  });
}

class SoteriaApp extends ConsumerWidget {
  const SoteriaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startupAsync = ref.watch(appStartupProvider);

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return startupAsync.when(
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

class _AppFoundation extends ConsumerStatefulWidget {
  const _AppFoundation({required this.child});
  final Widget child;

  @override
  ConsumerState<_AppFoundation> createState() => _AppFoundationState();
}

class _AppFoundationState extends ConsumerState<_AppFoundation> {
  @override
  void initState() {
    super.initState();
    // 3. Trigger Background "Warming" of secondary services after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(appInitializationServiceProvider.notifier).performBackgroundInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Warm up Foundation Services
    ref.watch(performanceServiceProvider);
    ref.watch(accessibilityServiceProvider);
    ref.watch(appLifecycleServiceProvider);

    return widget.child;
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
      theme: SoteriaTheme.dark,
      darkTheme: SoteriaTheme.dark,
      themeMode: ThemeMode.dark,
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
        ref.read(accessibilityServiceProvider).updateFromMediaQuery(
          MediaQuery.of(context),
        );

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
      theme: SoteriaTheme.dark,
      home: const Scaffold(
        body: Center(
          child: SoteriaCircularLoader(),
        ),
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
      theme: SoteriaTheme.dark,
      home: Scaffold(
        body: Center(
          child: Text('Startup Error: $error'),
        ),
      ),
    );
  }
}
