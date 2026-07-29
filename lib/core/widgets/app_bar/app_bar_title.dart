import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
    required this.title,
    this.subtitle,
    this.isCentered = false,
  });

  final String title;
  final String? subtitle;
  final bool isCentered;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: isCentered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        AnimatedSwitcher(
          duration: SoteriaAnimations.medium,
          child: Text(
            title,
            key: ValueKey(title),
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              letterSpacing: -0.5,
            ),
          ),
        ),
        if (subtitle != null && subtitle!.isNotEmpty)
          AnimatedSwitcher(
            duration: SoteriaAnimations.medium,
            child: Text(
              subtitle!,
              key: ValueKey(subtitle),
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
              ),
            ),
          ),
      ],
    );
  }
}
