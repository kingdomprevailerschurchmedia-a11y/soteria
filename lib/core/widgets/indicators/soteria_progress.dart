import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';

/// SoteriaLinearProgress is a stylized linear progress bar.
class SoteriaLinearProgress extends StatelessWidget {
  const SoteriaLinearProgress({
    super.key,
    required this.value,
    this.color,
    this.backgroundColor,
    this.height = 8,
  });

  final double value;
  final Color? color;
  final Color? backgroundColor;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(SoteriaRadius.full),
      child: LinearProgressIndicator(
        value: value,
        minHeight: height,
        backgroundColor: backgroundColor ?? (color ?? Theme.of(context).primaryColor).withValues(alpha: 0.1),
        valueColor: AlwaysStoppedAnimation<Color>(color ?? Theme.of(context).primaryColor),
      ),
    );
  }
}
