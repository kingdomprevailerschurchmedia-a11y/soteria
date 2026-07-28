import 'package:flutter/material.dart';
import '../../../../../core/widgets/cards/soteria_card.dart';

class RegistrationReviewCard extends StatelessWidget {
  const RegistrationReviewCard({
    super.key,
    required this.label,
    required this.value,
    required this.onEdit,
  });

  final String label;
  final String value;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    return SoteriaCard(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label.toUpperCase(),
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.grey, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit_outlined, size: 20),
            onPressed: onEdit,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
