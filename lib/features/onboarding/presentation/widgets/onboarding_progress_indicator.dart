import 'package:flutter/material.dart';
import '../../../../core/design_system/design_system.dart';

/// A set of animated dash indicators for the onboarding flow.
class OnboardingProgressIndicator extends StatelessWidget {
  const OnboardingProgressIndicator({
    super.key,
    required this.itemCount,
    required this.currentIndex,
  });

  final int itemCount;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        itemCount,
        (index) => _Dash(isActive: index == currentIndex),
      ),
    );
  }
}

class _Dash extends StatelessWidget {
  const _Dash({required this.isActive});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: SoteriaAnimations.fast,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 6,
      width: isActive ? 24 : 6,
      decoration: BoxDecoration(
        color: isActive 
            ? Theme.of(context).primaryColor 
            : Theme.of(context).disabledColor.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(SoteriaRadius.full),
      ),
    );
  }
}
