import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';

/// SoteriaSearchField is a high-polish search input with a leading icon.
class SoteriaSearchField extends StatelessWidget {
  const SoteriaSearchField({
    super.key,
    this.controller,
    this.hintText = 'Search...',
    this.onChanged,
    this.onClear,
  });

  final TextEditingController? controller;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: controller,
      hintText: hintText,
      elevation: const WidgetStatePropertyAll(0),
      backgroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.5)),
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(SoteriaRadius.m))),
      leading: const Icon(SoteriaIcons.search),
      onChanged: onChanged,
      trailing: [
        if (controller?.text.isNotEmpty ?? false)
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              controller?.clear();
              onClear?.call();
            },
          ),
      ],
    );
  }
}
