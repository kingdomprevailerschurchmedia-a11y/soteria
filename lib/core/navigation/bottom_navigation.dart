import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../design_system/design_system.dart';
import 'navigation_destination.dart';
import 'application/navigation_controller.dart';

/// SoteriaBottomNavigation is a high-polish, animated navigation bar
/// that follows the Soteria Design System.
class SoteriaBottomNavigation extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final badges = ref.watch(navigationControllerProvider.select((s) => s.badges));
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(
          top: BorderSide(
            color: theme.dividerColor.withValues(alpha: 0.1),
            width: 1,
          ),
        ),
        boxShadow: [
          if (theme.brightness == Brightness.light)
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: SoteriaSpacing.s8,
            vertical: SoteriaSpacing.s12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(destinations.length, (index) {
              final d = destinations[index];
              final isSelected = index == currentIndex;
              final badge = badges[d.id];

              return _BottomNavItem(
                destination: d,
                isSelected: isSelected,
                badgeCount: badge?.count ?? 0,
                showDot: badge?.showDot ?? false,
                onTap: () => onDestinationSelected(index),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  const _BottomNavItem({
    required this.destination,
    required this.isSelected,
    required this.onTap,
    this.badgeCount = 0,
    this.showDot = false,
  });

  final SoteriaNavigationDestination destination;
  final bool isSelected;
  final VoidCallback onTap;
  final int badgeCount;
  final bool showDot;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = isSelected ? theme.primaryColor : Colors.grey;

    return Semantics(
      button: true,
      selected: isSelected,
      label: destination.label,
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: SizedBox(
          width: 72,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  AnimatedContainer(
                    duration: SoteriaAnimations.medium,
                    curve: SoteriaAnimations.standard,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected 
                        ? theme.primaryColor.withValues(alpha: 0.1) 
                        : Colors.transparent,
                      borderRadius: BorderRadius.circular(SoteriaRadius.full),
                    ),
                    child: InkWell(
                      onTap: onTap,
                      borderRadius: BorderRadius.circular(SoteriaRadius.full),
                      child: AnimatedScale(
                        duration: SoteriaAnimations.medium,
                        scale: isSelected ? 1.1 : 1.0,
                        child: Icon(
                          isSelected ? destination.selectedIcon : destination.icon,
                          color: color,
                          size: 26,
                        ),
                      ),
                    ),
                  ),
                  if (badgeCount > 0)
                    Positioned(
                      top: -2,
                      right: -2,
                      child: _BadgeCircle(count: badgeCount),
                    )
                  else if (showDot)
                    Positioned(
                      top: 0,
                      right: 0,
                      child: _BadgeDot(),
                    ),
                ],
              ),
              const SizedBox(height: 4),
              AnimatedDefaultTextStyle(
                duration: SoteriaAnimations.fast,
                style: theme.textTheme.labelSmall!.copyWith(
                  color: color,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  fontSize: 10,
                ),
                child: Text(destination.label.toUpperCase()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BadgeCircle extends StatelessWidget {
  const _BadgeCircle({required this.count});
  final int count;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: SoteriaAnimations.medium,
      curve: Curves.easeOutBack,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            decoration: BoxDecoration(
              color: SoteriaColors.error,
              borderRadius: BorderRadius.circular(SoteriaRadius.full),
              border: Border.all(color: Colors.white, width: 1.5),
            ),
            constraints: const BoxConstraints(
              minWidth: 18,
              minHeight: 18,
            ),
            child: Text(
              count > 9 ? '9+' : count.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
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
