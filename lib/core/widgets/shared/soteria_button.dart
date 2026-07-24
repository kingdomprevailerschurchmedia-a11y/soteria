import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import '../../theme/tokens.dart';

/// SoteriaButton is a customizable button component that supports various types.
class SoteriaButton extends StatelessWidget {
  const SoteriaButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.isLoading = false,
    this.isDisabled = false,
    this.icon,
    this.type = SoteriaButtonType.primary,
    this.width,
  });

  /// Callback when the button is pressed.
  final VoidCallback? onPressed;

  /// The text label to display on the button.
  final String label;

  /// If true, a loading indicator is shown instead of the label.
  final bool isLoading;

  /// If true, the button is visually and functionally disabled.
  final bool isDisabled;

  /// Optional icon to display before the label.
  final IconData? icon;

  /// The visual type of the button.
  final SoteriaButtonType type;

  /// Optional fixed width for the button.
  final double? width;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    final Widget content = isLoading
        ? const SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 20),
                const SizedBox(width: AppSpacing.s),
              ],
              Text(label),
            ],
          );

    final effectiveOnPressed = (isLoading || isDisabled) ? null : onPressed;

    return SizedBox(
      width: width,
      height: 48,
      child: _buildButton(theme, content, effectiveOnPressed),
    );
  }

  Widget _buildButton(ThemeData theme, Widget content, VoidCallback? onPressed) {
    switch (type) {
      case SoteriaButtonType.primary:
        return ElevatedButton(
          onPressed: onPressed,
          child: content,
        );
      case SoteriaButtonType.secondary:
        return FilledButton.tonal(
          onPressed: onPressed,
          child: content,
        );
      case SoteriaButtonType.outlined:
        return OutlinedButton(
          onPressed: onPressed,
          child: content,
        );
      case SoteriaButtonType.text:
        return TextButton(
          onPressed: onPressed,
          child: content,
        );
    }
  }
}

/// Defines the visual types available for [SoteriaButton].
enum SoteriaButtonType {
  primary,
  secondary,
  outlined,
  text,
}

// --- Previews ---

@Preview(name: 'Button - Primary')
Widget primaryButtonPreview() {
  return MaterialApp(
    home: Scaffold(
      body: Center(
        child: SoteriaButton(
          onPressed: () {},
          label: 'Primary Button',
        ),
      ),
    ),
  );
}

@Preview(name: 'Button - Loading')
Widget loadingButtonPreview() {
  return MaterialApp(
    home: Scaffold(
      body: Center(
        child: SoteriaButton(
          onPressed: () {},
          label: 'Loading Button',
          isLoading: true,
        ),
      ),
    ),
  );
}

@Preview(name: 'Button - Disabled')
Widget disabledButtonPreview() {
  return MaterialApp(
    home: Scaffold(
      body: Center(
        child: SoteriaButton(
          onPressed: () {},
          label: 'Disabled Button',
          isDisabled: true,
        ),
      ),
    ),
  );
}
