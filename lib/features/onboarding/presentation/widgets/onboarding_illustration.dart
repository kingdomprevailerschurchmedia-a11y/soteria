import 'package:flutter/material.dart';
import '../../../../core/design_system/design_system.dart';

/// Defines the types of illustrations available for onboarding.
enum OnboardingIllustrationType {
  hero,
  practice,
  versus,
  tournament,
  leaderboard,
  ready,
}

/// A high-polish, abstract illustration widget for onboarding pages.
class OnboardingIllustration extends StatelessWidget {
  const OnboardingIllustration({
    super.key,
    required this.type,
    this.size = 280,
  });

  final OnboardingIllustrationType type;
  final double size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.primaryColor;

    return Semantics(
      label: _getAltText(),
      image: true,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: primaryColor.withValues(alpha: 0.05),
          shape: BoxShape.circle,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            _buildBackgroundCircles(primaryColor),
            _buildMainIcon(primaryColor),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundCircles(Color color) {
    return Stack(
      children: [
        Positioned(
          top: 20,
          right: 20,
          child: _Circle(size: 40, color: color.withValues(alpha: 0.1)),
        ),
        Positioned(
          bottom: 40,
          left: 30,
          child: _Circle(size: 60, color: color.withValues(alpha: 0.05)),
        ),
      ],
    );
  }

  Widget _buildMainIcon(Color color) {
    IconData icon;
    switch (type) {
      case OnboardingIllustrationType.hero:
        icon = Icons.auto_awesome_rounded;
        break;
      case OnboardingIllustrationType.practice:
        icon = SoteriaIcons.school;
        break;
      case OnboardingIllustrationType.versus:
        icon = Icons.bolt_rounded;
        break;
      case OnboardingIllustrationType.tournament:
        icon = SoteriaIcons.trophy;
        break;
      case OnboardingIllustrationType.leaderboard:
        icon = Icons.leaderboard_rounded;
        break;
      case OnboardingIllustrationType.ready:
        icon = Icons.rocket_launch_rounded;
        break;
    }

    return Icon(
      icon,
      size: size * 0.4,
      color: color,
    );
  }

  String _getAltText() {
    switch (type) {
      case OnboardingIllustrationType.hero:
        return 'Soteria Hero Illustration';
      case OnboardingIllustrationType.practice:
        return 'Practice Mode Illustration';
      case OnboardingIllustrationType.versus:
        return 'Versus Mode Illustration';
      case OnboardingIllustrationType.tournament:
        return 'Tournament Arena Illustration';
      case OnboardingIllustrationType.leaderboard:
        return 'Leaderboard Celebration Illustration';
      case OnboardingIllustrationType.ready:
        return 'Ready to Begin Illustration';
    }
  }
}

class _Circle extends StatelessWidget {
  const _Circle({required this.size, required this.color});
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
