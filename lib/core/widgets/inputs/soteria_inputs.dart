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
          Text(label!, style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: SoteriaSpacing.s8),
        ],
        DropdownButtonFormField<T>(
          initialValue: value,
          items: items,
          onChanged: onChanged,
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(SoteriaRadius.m),
              borderSide: BorderSide.none,
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
      title: label != null ? Text(label!, style: Theme.of(context).textTheme.bodyLarge) : null,
      value: value,
      onChanged: onChanged,
      contentPadding: EdgeInsets.zero,
      activeTrackColor: Theme.of(context).primaryColor,
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
      title: Text(label, style: Theme.of(context).textTheme.bodyLarge),
      value: value,
      onChanged: onChanged,
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: EdgeInsets.zero,
      activeColor: Theme.of(context).primaryColor,
    );
  }
}

/// SoteriaSlider is a styled range selection component.
class SoteriaSlider extends StatelessWidget {
  const SoteriaSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.min = 0,
    this.max = 100,
    this.divisions,
    this.label,
  });

  final double value;
  final ValueChanged<double>? onChanged;
  final double min;
  final double max;
  final int? divisions;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(label!, style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: SoteriaSpacing.s8),
        ],
        Slider.adaptive(
          value: value,
          min: min,
          max: max,
          divisions: divisions,
          label: value.round().toString(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
