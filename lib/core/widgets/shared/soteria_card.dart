import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import '../../theme/tokens.dart';

/// SoteriaCard is a standard container component with consistent padding and elevation.
class SoteriaCard extends StatelessWidget {
  const SoteriaCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(AppSpacing.m),
    this.onTap,
    this.color,
    this.elevation = AppElevation.level1,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  final Color? color;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      color: color,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.m),
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}

// --- Previews ---

@Preview(name: 'Card - Default')
Widget cardPreview() {
  return const MaterialApp(
    home: Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.m),
          child: SoteriaCard(
            child: Text('This is a Soteria Card'),
          ),
        ),
      ),
    ),
  );
}
