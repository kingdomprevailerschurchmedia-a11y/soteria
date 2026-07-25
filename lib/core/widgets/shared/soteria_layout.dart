import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';

/// SoteriaScaffold is a wrapper around Scaffold that provides consistent layout and padding.
class SoteriaScaffold extends StatelessWidget {
  const SoteriaScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.useSafeArea = true,
  });

  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final bool useSafeArea;

  @override
  Widget build(BuildContext context) {
    Widget content = body;
    if (useSafeArea) {
      content = SafeArea(child: content);
    }

    return Scaffold(
      appBar: appBar,
      body: content,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
  }
}

/// SoteriaSectionHeader displays a title and an optional action for a section.
class SoteriaSectionHeader extends StatelessWidget {
  const SoteriaSectionHeader({
    super.key,
    required this.title,
    this.actionLabel,
    this.onActionPressed,
  });

  final String title;
  final String? actionLabel;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: SoteriaSpacing.s16,
        vertical: SoteriaSpacing.s8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          if (actionLabel != null && onActionPressed != null)
            TextButton(
              onPressed: onActionPressed,
              child: Text(actionLabel!),
            ),
        ],
      ),
    );
  }
}

/// SoteriaDivider is a consistent horizontal line.
class SoteriaDivider extends StatelessWidget {
  const SoteriaDivider({super.key, this.indent = 0});

  final double indent;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: SoteriaBorders.thin,
      indent: indent,
      color: Theme.of(context).dividerColor.withValues(alpha: 0.1),
    );
  }
}
