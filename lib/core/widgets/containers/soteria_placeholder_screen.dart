import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../navigation/soteria_scaffold.dart';

/// SoteriaPlaceholderScreen is used for features that are under development.
class SoteriaPlaceholderScreen extends StatelessWidget {
  const SoteriaPlaceholderScreen({
    super.key,
    required this.title,
    required this.description,
    this.icon = Icons.construction_outlined,
  });

  final String title;
  final String description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SoteriaScaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(SoteriaSpacing.s32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(SoteriaSpacing.s24),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 64, color: Theme.of(context).primaryColor),
              ),
              const SizedBox(height: SoteriaSpacing.s32),
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: SoteriaSpacing.s16),
              Text(
                description,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.grey,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
