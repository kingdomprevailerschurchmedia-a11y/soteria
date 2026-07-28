import 'package:flutter/material.dart';

/// SoteriaFab is a high-polish Floating Action Button.
class SoteriaFab extends StatelessWidget {
  const SoteriaFab({
    super.key,
    required this.onPressed,
    required this.icon,
    this.label,
    this.backgroundColor,
    this.foregroundColor,
  });

  final VoidCallback onPressed;
  final IconData icon;
  final String? label;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    if (label != null) {
      return FloatingActionButton.extended(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label!.toUpperCase()),
        backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
        foregroundColor: foregroundColor ?? Colors.white,
      );
    }
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
      foregroundColor: foregroundColor ?? Colors.white,
      child: Icon(icon),
    );
  }
}
