import 'package:flutter/material.dart';
import '../../../../core/design_system/design_system.dart';

class CategoryIndicator extends StatelessWidget {
  final List<String> categories;

  const CategoryIndicator({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: categories.map((cat) => _Chip(label: cat)).toList(),
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  const _Chip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: SoteriaColors.surfaceL2,
        borderRadius: BorderRadius.circular(SoteriaRadius.full),
        border: Border.all(color: Colors.white10),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: SoteriaColors.textSecondary,
        ),
      ),
    );
  }
}
