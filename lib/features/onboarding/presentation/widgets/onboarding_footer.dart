import 'package:flutter/material.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/widgets/buttons/soteria_button.dart';
import 'onboarding_progress_indicator.dart';

/// The fixed bottom section of the onboarding flow.
class OnboardingFooter extends StatelessWidget {
  const OnboardingFooter({
    super.key,
    required this.itemCount,
    required this.currentIndex,
    required this.onNext,
    required this.onSkip,
    this.primaryLabel = 'CONTINUE',
    this.showSkip = true,
  });

  final int itemCount;
  final int currentIndex;
  final VoidCallback onNext;
  final VoidCallback onSkip;
  final String primaryLabel;
  final bool showSkip;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(SoteriaSpacing.s24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          OnboardingProgressIndicator(
            itemCount: itemCount,
            currentIndex: currentIndex,
          ),
          const SizedBox(height: SoteriaSpacing.s48),
          SoteriaButton(
            onPressed: onNext,
            label: primaryLabel.toUpperCase(),
          ),
          const SizedBox(height: SoteriaSpacing.s16),
          if (showSkip)
            TextButton(
              onPressed: onSkip,
              child: Text(
                'SKIP',
                style: TextStyle(
                  color: Theme.of(context).disabledColor,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            )
          else
            const SizedBox(height: 48), // Spacer to maintain height
        ],
      ),
    );
  }
}
