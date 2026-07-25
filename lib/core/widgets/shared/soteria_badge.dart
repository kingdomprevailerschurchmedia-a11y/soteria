import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import '../../design_system/design_system.dart';

/// SoteriaBadge displays a small piece of information or status.
class SoteriaBadge extends StatelessWidget {
  const SoteriaBadge({
    super.key,
    required this.label,
    this.color = SoteriaColors.primaryLight,
    this.textColor = Colors.white,
  });

  final String label;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: SoteriaSpacing.s8,
        vertical: SoteriaSpacing.s4,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(SoteriaRadius.full),
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
  return MaterialApp(
    theme: SoteriaTheme.light,
    home: const Scaffold(
      body: Center(
        child: SoteriaBadge(
          label: 'NEW',
          color: SoteriaColors.success,
        ),
      ),
    ),
  );
}
