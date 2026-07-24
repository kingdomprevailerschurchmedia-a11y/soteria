import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import '../../theme/tokens.dart';

/// SoteriaBadge displays a small piece of information or status.
class SoteriaBadge extends StatelessWidget {
  const SoteriaBadge({
    super.key,
    required this.label,
    this.color = AppColors.primaryLight,
    this.textColor = Colors.white,
  });

  final String label;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.s,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(AppRadius.circular),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}

// --- Previews ---

@Preview(name: 'Badge - Success')
Widget badgePreview() {
  return const MaterialApp(
    home: Scaffold(
      body: Center(
        child: SoteriaBadge(
          label: 'NEW',
          color: AppColors.success,
        ),
      ),
    ),
  );
}
