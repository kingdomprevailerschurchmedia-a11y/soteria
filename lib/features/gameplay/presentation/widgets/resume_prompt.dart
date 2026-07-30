import 'package:flutter/material.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/widgets/buttons/soteria_button.dart';
import '../../domain/entities/game_session.dart';

class ResumePrompt extends StatelessWidget {
  const ResumePrompt({
    super.key,
    required this.session,
    required this.onResume,
    required this.onDiscard,
  });

  final GameSession session;
  final VoidCallback onResume;
  final VoidCallback onDiscard;

  @override
  Widget build(BuildContext context) {
    return SoteriaCard(
      padding: const EdgeInsets.all(SoteriaSpacing.s24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.history, size: 48, color: SoteriaColors.primary),
          const SizedBox(height: SoteriaSpacing.s16),
          Text(
            'UNFINISHED SESSION',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: SoteriaSpacing.s8),
          Text(
            'You have a ${session.mode} session in progress. Would you like to resume?',
            textAlign: TextAlign.center,
            style: const TextStyle(color: SoteriaColors.textSecondary),
          ),
          const SizedBox(height: SoteriaSpacing.s24),
          SoteriaButton(
            label: 'RESUME SESSION',
            onPressed: onResume,
          ),
          const SizedBox(height: SoteriaSpacing.s12),
          SoteriaButton(
            label: 'DISCARD',
            type: SoteriaButtonType.outlined,
            onPressed: onDiscard,
          ),
        ],
      ),
    );
  }
}
