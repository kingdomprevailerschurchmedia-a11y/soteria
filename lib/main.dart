import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/config/app_config.dart';
import 'core/routes/app_router.dart';
import 'core/design_system/design_system.dart';
import 'core/services/startup_service.dart';
import 'core/services/ui_service.dart';
import 'core/widgets/shared/soteria_states.dart';
import 'core/localization/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(
    const ProviderScope(
      child: SoteriaApp(),
    ),
  );
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
            child: const _AppContent(),
          ),
          loading: () => const _LoadingApp(),
          error: (err, stack) => _ErrorApp(error: err),
        );
      },
    );
  }
}

class _AppContent extends ConsumerWidget {
  const _AppContent();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    final locale = ref.watch(localeProvider);
    final isLoading = ref.watch(loadingOverlayProvider);

    return Stack(
      children: [
        MaterialApp.router(
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
        ),
        if (isLoading)
          const Material(
            color: Colors.black26,
            child: Center(
              child: SoteriaLoadingState(),
            ),
          ),
      ],
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
        body: SoteriaLoadingState(),
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
