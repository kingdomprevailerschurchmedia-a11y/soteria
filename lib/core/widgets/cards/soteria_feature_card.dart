import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import 'soteria_card.dart';

/// FeatureCard is used to highlight specific app features or categories.
class SoteriaFeatureCard extends StatelessWidget {
  const SoteriaFeatureCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    this.onTap,
  });

  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SoteriaCard(
      onTap: onTap,
      borderColor: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(SoteriaSpacing.s12),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: SoteriaIcons.m),
          ),
          const SizedBox(height: SoteriaSpacing.s16),
          Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: SoteriaSpacing.s8),
          Text(
            description,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
