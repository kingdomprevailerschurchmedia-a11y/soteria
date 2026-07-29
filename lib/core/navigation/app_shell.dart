import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'responsive_shell.dart';
import 'navigation_destination.dart';
import '../../features/auth/presentation/providers/auth_providers.dart';
import '../../features/auth/presentation/widgets/guest/guest_banner.dart';
import '../../features/auth/presentation/widgets/guest/upgrade_dialog.dart';

/// AppShell is the main stateful shell that maintains navigation state.
class AppShell extends ConsumerWidget {
  const AppShell({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authStateProvider);

    // Filter debug-only destinations if not in debug mode
    final destinations = appDestinations.where((d) {
      if (d.isDebugOnly && !kDebugMode) return false;
      return true;
    }).toList();

    return Column(
      children: [
        if (auth.isGuest)
          GuestBanner(
            onUpgrade: () => showUpgradeDialog(context, 'Full Scholar Experience'),
          ),
        Expanded(
          child: ResponsiveShell(
            currentIndex: navigationShell.currentIndex,
            onDestinationSelected: (index) => _onTap(context, index),
            destinations: destinations,
            child: navigationShell,
          ),
        ),
      ],
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
