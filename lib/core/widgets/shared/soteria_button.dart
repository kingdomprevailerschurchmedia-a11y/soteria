import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import '../../design_system/design_system.dart';
import '../../utils/app_animations.dart';

/// SoteriaButton is a premium button component with bounce effects and haptics.
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

  final VoidCallback? onPressed;
  final String label;
  final bool isLoading;
  final bool isDisabled;
  final IconData? icon;
  final SoteriaButtonType type;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return AppAnimations.bounceClick(
      onTap: onPressed ?? () {},
      isDisabled: isDisabled || isLoading || onPressed == null,
      child: SizedBox(
        width: width,
        height: 56, // Taller for premium feel
        child: DecoratedBox(
          decoration: _getDecoration(context),
          child: Center(
            child: _buildContent(context),
          ),
        ),
      ),
    );
  }

  Decoration _getDecoration(BuildContext context) {
    if (isDisabled) {
      return BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(SoteriaRadius.m),
      );
    }

    switch (type) {
      case SoteriaButtonType.reward:
        return BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFFFD700), Color(0xFFFFA500)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(SoteriaRadius.m),
          boxShadow: [
            BoxShadow(
              color: Colors.orange.withAlpha(100),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        );
      case SoteriaButtonType.primary:
        return BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(SoteriaRadius.m),
        );
      case SoteriaButtonType.outlined:
        return BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColor, width: 2),
          borderRadius: BorderRadius.circular(SoteriaRadius.m),
        );
      case SoteriaButtonType.danger:
        return BoxDecoration(
          color: SoteriaColors.error,
          borderRadius: BorderRadius.circular(SoteriaRadius.m),
        );
      case SoteriaButtonType.success:
        return BoxDecoration(
          color: SoteriaColors.success,
          borderRadius: BorderRadius.circular(SoteriaRadius.m),
        );
    }
  }

  Widget _buildContent(BuildContext context) {
    if (isLoading) {
      return const SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(
          strokeWidth: 3,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    }

    final color = _getContentColor();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          Icon(icon, color: color, size: 20),
          const SizedBox(width: SoteriaSpacing.s8),
        ],
        Text(
          label.toUpperCase(),
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: color,
                letterSpacing: 1.2,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }

  Color _getContentColor() {
    if (isDisabled) return Colors.grey.shade600;
    if (type == SoteriaButtonType.outlined) return SoteriaColors.primaryLight;
    if (type == SoteriaButtonType.reward) return Colors.black87;
    return Colors.white;
  }
}

enum SoteriaButtonType { primary, outlined, danger, success, reward }

// --- Previews ---

@Preview(name: 'Button - Primary')
Widget primaryButtonPreview() {
  return MaterialApp(
    theme: SoteriaTheme.light,
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
    theme: SoteriaTheme.light,
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
    theme: SoteriaTheme.light,
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
