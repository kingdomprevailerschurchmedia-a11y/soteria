import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/widgets/navigation/soteria_scaffold.dart';
import '../../../../core/widgets/loading/soteria_loading.dart';
import '../../../../core/widgets/error/soteria_error_state.dart';
import '../../../../core/widgets/cards/soteria_card.dart';
import '../../../../core/navigation/navigation_constants.dart';
import '../../../../core/services/ui_service.dart';
import '../widgets/dashboard_cards.dart';
import '../../application/dashboard_providers.dart';
import '../../domain/entities/app_diagnostics.dart';
import '../../../../features/personalization/presentation/providers/personalization_provider.dart';
import '../../../../features/auth/presentation/providers/auth_providers.dart';

/// The main entry point for developer tools and diagnostics.
class DeveloperDashboardScreen extends ConsumerWidget {
  const DeveloperDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appDiagAsync = ref.watch(appDiagnosticsProvider);
    final deviceDiag = ref.watch(deviceDiagnosticsProvider);
    final authState = ref.watch(authStateProvider);

    return SoteriaScaffold(
      appBar: AppBar(
        title: const Text('Developer Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history_outlined),
            onPressed: () => context.pushNamed(NavigationConstants.logsName),
            tooltip: 'View Logs',
          ),
        ],
      ),
      body: appDiagAsync.when(
        data: (appDiag) => ListView(
          padding: const EdgeInsets.all(SoteriaSpacing.s16),
          children: [
            _buildSectionHeader(context, 'Diagnostics'),
            const SizedBox(height: SoteriaSpacing.s16),
            InfoCard(
              title: 'Identity & Auth',
              icon: Icons.fingerprint_rounded,
              data: {
                'Status': authState.status.name.toUpperCase(),
                'User ID': authState.user?.id ?? 'none',
                'User Name': authState.user?.username ?? 'none',
                'Is Guest': authState.user?.isGuest.toString() ?? 'false',
              },
            ),
            const SizedBox(height: SoteriaSpacing.s16),
            InfoCard(
              title: 'Application',
              icon: Icons.info_outline,
              data: {
                'App Name': appDiag.appName,
                'Version': appDiag.version,
                'Build': appDiag.buildNumber,
                'Package': appDiag.packageName,
                'Environment': appDiag.environment.toUpperCase(),
                'Build Mode': appDiag.isReleaseMode ? 'RELEASE' : 'DEBUG',
              },
            ),
            const SizedBox(height: SoteriaSpacing.s16),
            InfoCard(
              title: 'Device & Screen',
              icon: Icons.smartphone_outlined,
              data: {
                'Platform': deviceDiag.platform,
                'Model': deviceDiag.deviceModel,
                'Screen Size': '${deviceDiag.screenWidth.toInt()}x${deviceDiag.screenHeight.toInt()}',
                'Pixel Ratio': deviceDiag.pixelRatio.toStringAsFixed(2),
                'Orientation': deviceDiag.orientation,
              },
            ),
            const SizedBox(height: SoteriaSpacing.s32),
            _buildSectionHeader(context, 'Quick Actions'),
            const SizedBox(height: SoteriaSpacing.s16),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 2,
              mainAxisSpacing: SoteriaSpacing.s12,
              crossAxisSpacing: SoteriaSpacing.s12,
              children: [
                ActionCard(
                  title: 'Design Gallery',
                  icon: Icons.palette_outlined,
                  onTap: () => context.pushNamed(NavigationConstants.galleryName),
                ),
                ActionCard(
                  title: 'Feature Flags',
                  icon: Icons.flag_outlined,
                  onTap: () => context.pushNamed(NavigationConstants.featureFlagsName),
                ),
                ActionCard(
                  title: 'Analytics',
                  icon: Icons.analytics_outlined,
                  onTap: () => context.pushNamed(NavigationConstants.analyticsName),
                ),
                ActionCard(
                  title: 'Performance',
                  icon: Icons.speed_rounded,
                  onTap: () => context.pushNamed(NavigationConstants.performanceName),
                ),
                ActionCard(
                  title: 'Accessibility',
                  icon: Icons.accessibility_new_rounded,
                  onTap: () => context.pushNamed(NavigationConstants.accessibilityName),
                ),
                ActionCard(
                  title: 'Validation',
                  icon: Icons.fact_check_outlined,
                  onTap: () => context.pushNamed(NavigationConstants.validationName),
                ),
                ActionCard(
                  title: 'Clear Prefs',
                  icon: Icons.delete_forever_outlined,
                  color: SoteriaColors.error,
                  onTap: () => _handleClearPrefs(context, ref),
                ),
                ActionCard(
                  title: 'Reset Mocks',
                  icon: Icons.refresh_outlined,
                  onTap: () => _handleResetMocks(context, ref),
                ),
                ActionCard(
                  title: 'Reset Profile',
                  icon: Icons.person_remove_outlined,
                  color: SoteriaColors.warning,
                  onTap: () => _handleResetProfile(context, ref),
                ),
                ActionCard(
                  title: 'Copy Device Info',
                  icon: Icons.copy_outlined,
                  onTap: () => _handleCopyInfo(context, ref, deviceDiag),
                ),
              ],
            ),
            const SizedBox(height: SoteriaSpacing.s32),
            _buildSectionHeader(context, 'System Flags'),
            const SizedBox(height: SoteriaSpacing.s16),
            SoteriaCard(
              child: Column(
                children: [
                  SwitchListTile.adaptive(
                    title: const Text('Simulate Slow Network'),
                    value: false,
                    onChanged: (v) {},
                  ),
                  const Divider(),
                  SwitchListTile.adaptive(
                    title: const Text('Enable Verbose Logging'),
                    value: true,
                    onChanged: (v) {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: SoteriaSpacing.s64),
          ],
        ),
        loading: () => const SoteriaCircularLoader(),
        error: (e, st) => SoteriaErrorState(message: e.toString()),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Text(
      title.toUpperCase(),
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
    );
  }

  void _handleClearPrefs(BuildContext context, WidgetRef ref) {
    ref.read(uiServiceProvider).showConfirmationDialog(
      context: context,
      title: 'Clear Preferences',
      message: 'This will delete all local SharedPreferences and restart the app context. Proceed?',
      isDangerous: true,
      confirmLabel: 'CLEAR',
    );
  }

  void _handleResetMocks(BuildContext context, WidgetRef ref) {
    ref.read(uiServiceProvider).showSnackBar(
      context: context,
      message: 'Mock repositories reset to defaults.',
    );
  }

  void _handleResetProfile(BuildContext context, WidgetRef ref) {
    ref.read(personalizationProvider.notifier).resetAll();
    ref.read(uiServiceProvider).showSnackBar(
      context: context,
      message: 'Learning Profile reset. Redirecting...',
    );
  }

  void _handleCopyInfo(BuildContext context, WidgetRef ref, DeviceDiagnostics diag) {
    ref.read(uiServiceProvider).showSnackBar(
      context: context,
      message: 'Device info copied to clipboard.',
    );
  }
}

// --- Previews ---

@Preview(name: 'Dev - Dashboard')
Widget developerDashboardPreview() {
  return const ProviderScope(
    child: MaterialApp(
      home: DeveloperDashboardScreen(),
    ),
  );
}
