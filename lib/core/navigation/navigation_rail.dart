import 'package:flutter/material.dart';
import '../design_system/design_system.dart';
import 'navigation_destination.dart';

/// SoteriaNavigationRail is a responsive M3 NavigationRail for larger screens.
class SoteriaNavigationRail extends StatelessWidget {
  const SoteriaNavigationRail({
    super.key,
    required this.currentIndex,
    required this.onDestinationSelected,
    required this.destinations,
    this.extended = false,
  });

  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;
  final List<SoteriaNavigationDestination> destinations;
  final bool extended;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: currentIndex,
      onDestinationSelected: onDestinationSelected,
      extended: extended,
      labelType: extended ? NavigationRailLabelType.none : NavigationRailLabelType.all,
      leading: Padding(
        padding: const EdgeInsets.symmetric(vertical: SoteriaSpacing.s24),
        child: FlutterLogo(size: extended ? 48 : 32),
      ),
      destinations: destinations.map((d) {
        return NavigationRailDestination(
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
          label: Text(d.label),
        );
      }).toList(),
    );
  }
}
