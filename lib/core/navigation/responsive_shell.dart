import 'package:flutter/material.dart';
import 'bottom_navigation.dart';
import 'navigation_rail.dart';
import 'navigation_destination.dart';

/// ResponsiveShell manages the navigation layout based on screen size.
class ResponsiveShell extends StatelessWidget {
  const ResponsiveShell({
    super.key,
    required this.child,
    required this.currentIndex,
    required this.onDestinationSelected,
    required this.destinations,
  });

  final Widget child;
  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;
  final List<SoteriaNavigationDestination> destinations;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1024) {
          // Desktop/Web
          return Scaffold(
            body: Row(
              children: [
                SoteriaNavigationRail(
                  currentIndex: currentIndex,
                  onDestinationSelected: onDestinationSelected,
                  destinations: destinations,
                  extended: true,
                ),
                const VerticalDivider(width: 1),
                Expanded(child: child),
              ],
            ),
          );
        }

        if (constraints.maxWidth >= 600) {
          // Tablet
          return Scaffold(
            body: Row(
              children: [
                SoteriaNavigationRail(
                  currentIndex: currentIndex,
                  onDestinationSelected: onDestinationSelected,
                  destinations: destinations,
                ),
                const VerticalDivider(width: 1),
                Expanded(child: child),
              ],
            ),
          );
        }

        // Mobile
        return Scaffold(
          body: child,
          bottomNavigationBar: SoteriaBottomNavigation(
            currentIndex: currentIndex,
            onDestinationSelected: onDestinationSelected,
            destinations: destinations,
          ),
        );
      },
    );
  }
}
