import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';

/// SoteriaDropdown provides a styled dropdown selection.
class SoteriaDropdown<T> extends StatelessWidget {
  const SoteriaDropdown({
    super.key,
    required this.items,
    this.value,
    this.onChanged,
    this.label,
  });

  final List<DropdownMenuItem<T>> items;
  final T? value;
  final ValueChanged<T?>? onChanged;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(label!, style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: SoteriaSpacing.s8),
        ],
        DropdownButtonFormField<T>(
          value: value,
          items: items,
          onChanged: onChanged,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(SoteriaRadius.m),
            ),
          ),
        ),
      ],
    );
  }
}

/// SoteriaSwitch is a styled toggle switch.
class SoteriaSwitch extends StatelessWidget {
  const SoteriaSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
      title: label != null ? Text(label!) : null,
      value: value,
      onChanged: onChanged,
      contentPadding: EdgeInsets.zero,
    );
  }
}

/// SoteriaCheckbox is a styled checkbox with a label.
class SoteriaCheckbox extends StatelessWidget {
  const SoteriaCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.label,
  });

  final bool value;
  final ValueChanged<bool?> onChanged;
  final String label;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(label),
      value: value,
      onChanged: onChanged,
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: EdgeInsets.zero,
    );
  }
}
