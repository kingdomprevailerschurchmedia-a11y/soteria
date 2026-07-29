import 'package:flutter/material.dart';
import '../../../../../core/design_system/design_system.dart';
import '../../../../../core/widgets/cards/soteria_card.dart';
import 'upgrade_dialog.dart';

class RestrictedFeatureCard extends StatelessWidget {
  const RestrictedFeatureCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;
  final String description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SoteriaCard(
      onTap: () => showUpgradeDialog(context, title),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Icon(icon, size: 64, color: Colors.grey.shade300),
              const Positioned(
                bottom: 0,
                right: 0,
                child: Icon(Icons.lock_rounded, size: 24, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: SoteriaSpacing.s24),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: SoteriaSpacing.s8),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
