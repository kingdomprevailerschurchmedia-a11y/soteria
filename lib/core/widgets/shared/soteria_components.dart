import 'package:flutter/material.dart';
import '../../theme/tokens.dart';

/// SoteriaChip is a compact element that represents an attribute or action.
class SoteriaChip extends StatelessWidget {
  const SoteriaChip({
    super.key,
    required this.label,
    this.onSelected,
    this.isSelected = false,
  });

  final String label;
  final ValueChanged<bool>? onSelected;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: onSelected,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.s),
      ),
    );
  }
}

/// SoteriaAvatar displays a user image or initials.
class SoteriaAvatar extends StatelessWidget {
  const SoteriaAvatar({
    super.key,
    this.imageUrl,
    this.initials,
    this.size = 40,
  });

  final String? imageUrl;
  final String? initials;
  final double size;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size / 2,
      backgroundColor: Theme.of(context).primaryColor.withValues(alpha: 0.1),
      backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
      child: imageUrl == null && initials != null
          ? Text(
              initials!,
              style: TextStyle(
                fontSize: size * 0.4,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            )
          : null,
    );
  }
}

/// SoteriaTag is a non-interactive label for categorization.
class SoteriaTag extends StatelessWidget {
  const SoteriaTag({
    super.key,
    required this.label,
    required this.color,
  });

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppRadius.xs),
        border: Border.all(color: color.withValues(alpha: 0.5)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }
}
