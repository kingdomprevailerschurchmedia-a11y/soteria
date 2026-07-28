import 'package:flutter/material.dart';
import '../../../../core/design_system/design_system.dart';
import 'onboarding_illustration.dart';

/// A single page in the onboarding flow.
class OnboardingPageWidget extends StatelessWidget {
  const OnboardingPageWidget({
    super.key,
    required this.title,
    required this.description,
    required this.illustrationType,
  });

  final String title;
  final String description;
  final OnboardingIllustrationType illustrationType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SoteriaSpacing.s32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 3),
          OnboardingIllustration(type: illustrationType),
          const Spacer(flex: 2),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
          ),
          const SizedBox(height: SoteriaSpacing.s24),
          Text(
            description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey.shade600,
                  height: 1.5,
                ),
          ),
          const Spacer(flex: 4),
        ],
      ),
    );
  }
}
