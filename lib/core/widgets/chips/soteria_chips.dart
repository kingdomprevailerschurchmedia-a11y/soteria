import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';

/// SoteriaChoiceChip is used for single selection among multiple options.
class SoteriaChoiceChip<T> extends StatelessWidget {
  const SoteriaChoiceChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onSelected,
  });

  final String label;
  final bool selected;
  final ValueChanged<bool> onSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: onSelected,
      selectedColor: Theme.of(context).colorScheme.primaryContainer,
      labelStyle: TextStyle(
        color: selected ? Theme.of(context).colorScheme.primary : null,
        fontWeight: selected ? FontWeight.bold : null,
      ),
    );
  }
}

/// SoteriaFilterChip is used for filtering content.
class SoteriaFilterChip extends StatelessWidget {
  const SoteriaFilterChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onSelected,
    this.icon,
  });

  final String label;
  final bool selected;
  final ValueChanged<bool> onSelected;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      avatar: icon != null ? Icon(icon, size: 16) : null,
      label: Text(label),
      selected: selected,
      onSelected: onSelected,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SoteriaRadius.s)),
    );
  }
}

/// SoteriaActionChip triggers a specific action.
class SoteriaActionChip extends StatelessWidget {
  const SoteriaActionChip({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
  });

  final String label;
  final VoidCallback onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      avatar: icon != null ? Icon(icon, size: 16) : null,
      label: Text(label),
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SoteriaRadius.s)),
    );
  }
}
