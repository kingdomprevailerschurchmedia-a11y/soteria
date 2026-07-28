import 'package:flutter/material.dart';
import 'navigation_destination.dart';

/// SoteriaBottomNavigation is a responsive M3 NavigationBar.
class SoteriaBottomNavigation extends StatelessWidget {
  const SoteriaBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onDestinationSelected,
    required this.destinations,
  });

  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;
  final List<SoteriaNavigationDestination> destinations;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: onDestinationSelected,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      destinations: destinations.map((d) {
        return NavigationDestination(
          icon: d.badgeCount != null
              ? Badge(
                  label: Text(d.badgeCount.toString()),
                  child: Icon(d.icon),
                )
              : Icon(d.icon),
          selectedIcon: d.badgeCount != null
              ? Badge(
                  label: Text(d.badgeCount.toString()),
                  child: Icon(d.selectedIcon),
                )
              : Icon(d.selectedIcon),
          label: d.label,
        );
      }).toList(),
    );
  }
}
