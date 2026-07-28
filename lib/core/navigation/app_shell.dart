import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'responsive_shell.dart';
import 'navigation_destination.dart';

/// AppShell is the main stateful shell that maintains navigation state.
class AppShell extends StatelessWidget {
  const AppShell({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    // Filter debug-only destinations if not in debug mode
    final destinations = appDestinations.where((d) {
      if (d.isDebugOnly && !kDebugMode) return false;
      return true;
    }).toList();

    return ResponsiveShell(
      currentIndex: navigationShell.currentIndex,
      onDestinationSelected: (index) => _onTap(context, index),
      destinations: destinations,
      child: navigationShell,
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
