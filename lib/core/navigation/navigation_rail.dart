import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../design_system/design_system.dart';
import 'navigation_destination.dart';
import 'application/navigation_controller.dart';
import 'application/navigation_rail_controller.dart';
import 'domain/entities/navigation_badge.dart';

/// SoteriaNavigationRail is a responsive M3 NavigationRail for larger screens.
class SoteriaNavigationRail extends ConsumerWidget {
  const SoteriaNavigationRail({
    super.key,
    required this.currentIndex,
    required this.onDestinationSelected,
    required this.destinations,
  });

  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;
  final List<SoteriaNavigationDestination> destinations;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final badges = ref.watch(navigationControllerProvider.select((s) => s.badges));
    final railState = ref.watch(navigationRailControllerProvider);
    final isExtended = railState == RailState.extended;

    return NavigationRail(
      selectedIndex: currentIndex,
      onDestinationSelected: onDestinationSelected,
      extended: isExtended,
      backgroundColor: theme.colorScheme.surface,
      indicatorColor: theme.colorScheme.primary.withValues(alpha: 0.1),
      labelType: isExtended ? NavigationRailLabelType.none : NavigationRailLabelType.all,
      leading: Column(
        children: [
          const SizedBox(height: SoteriaSpacing.s24),
          _AnimatedLogo(extended: isExtended),
          const SizedBox(height: SoteriaSpacing.s32),
        ],
      ),
      trailing: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(isExtended ? Icons.chevron_left : Icons.chevron_right),
              onPressed: () {
                ref.read(navigationRailControllerProvider.notifier).setExpanded(!isExtended);
              },
            ),
            const SizedBox(height: SoteriaSpacing.s16),
          ],
        ),
      ),
      destinations: destinations.map((d) {
        final badge = badges[d.id];
        return NavigationRailDestination(
          icon: _buildIcon(d.icon, badge),
          selectedIcon: _buildIcon(d.selectedIcon, badge, isSelected: true),
          label: Text(
            d.label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildIcon(IconData icon, NavigationBadge? badge, {bool isSelected = false}) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Icon(icon, size: isSelected ? 28 : 24),
        if (badge != null && badge.count > 0)
          Positioned(
            top: -6,
            right: -10,
            child: _BadgeIndicator(count: badge.count),
          )
        else if (badge != null && badge.showDot)
          Positioned(
            top: 0,
            right: -2,
            child: _BadgeDot(),
          ),
      ],
    );
  }
}

class _AnimatedLogo extends StatelessWidget {
  const _AnimatedLogo({required this.extended});
  final bool extended;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: SoteriaAnimations.slow,
      curve: SoteriaAnimations.standard,
      width: extended ? 120 : 40,
      height: 40,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(SoteriaRadius.m),
      ),
      child: Center(
        child: Icon(
          extended ? Icons.shield_rounded : Icons.shield_outlined,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}

class _BadgeIndicator extends StatelessWidget {
  const _BadgeIndicator({required this.count});
  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
        color: SoteriaColors.error,
        borderRadius: BorderRadius.circular(SoteriaRadius.full),
        border: Border.all(color: Colors.white, width: 1.5),
      ),
      constraints: const BoxConstraints(minWidth: 18),
      child: Text(
        count > 9 ? '9+' : count.toString(),
        style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _BadgeDot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: const BoxDecoration(
        color: SoteriaColors.streakOrange,
        shape: BoxShape.circle,
      ),
    );
  }
}
