import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../buttons/soteria_button.dart';

/// Dedicated screen for maintenance mode.
class SoteriaMaintenanceView extends StatelessWidget {
  const SoteriaMaintenanceView({
    super.key,
    this.estimatedTime = 'Short duration',
  });

  final String estimatedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(SoteriaSpacing.s32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(SoteriaSpacing.s24),
                decoration: BoxDecoration(
                  color: SoteriaColors.coinGold.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.settings_suggest_rounded, size: 64, color: SoteriaColors.coinGold),
              ),
              const SizedBox(height: SoteriaSpacing.s32),
              Text(
                'Improving the Arena',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: SoteriaSpacing.s16),
              const Text(
                'We are currently undergoing scheduled maintenance to bring you a better competitive experience.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: SoteriaSpacing.s24),
              Text(
                'Estimated back: $estimatedTime',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: SoteriaSpacing.s48),
              SoteriaButton(
                onPressed: () {}, // Implementation to check status or close app
                label: 'CHECK AGAIN',
                type: SoteriaButtonType.secondary,
                fullWidth: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
