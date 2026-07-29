import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/design_system/design_system.dart';
import '../../../../../core/widgets/buttons/soteria_button.dart';
import '../../../../../core/navigation/navigation_constants.dart';

class UpgradeDialog extends StatelessWidget {
  const UpgradeDialog({super.key, required this.featureName});
  final String featureName;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SoteriaRadius.l)),
      child: Padding(
        padding: const EdgeInsets.all(SoteriaSpacing.s32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(SoteriaSpacing.s24),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.stars_rounded, size: 48, color: Theme.of(context).primaryColor),
            ),
            const SizedBox(height: SoteriaSpacing.s24),
            Text(
              'Unlock $featureName',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: SoteriaSpacing.s16),
            Text(
              'Create a permanent scholar account to access competitive modes, earn real rewards, and save your progress across devices.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade600, height: 1.5),
            ),
            const SizedBox(height: SoteriaSpacing.s40),
            SoteriaButton(
              onPressed: () {
                context.pop();
                context.pushNamed(NavigationConstants.registerName);
              },
              label: 'CREATE ACCOUNT',
              type: SoteriaButtonType.reward,
            ),
            const SizedBox(height: SoteriaSpacing.s12),
            SoteriaButton(
              onPressed: () {
                context.pop();
                context.pushNamed(NavigationConstants.loginName);
              },
              label: 'LOG IN',
              type: SoteriaButtonType.outlined,
            ),
            const SizedBox(height: SoteriaSpacing.s8),
            TextButton(
              onPressed: () => context.pop(),
              child: const Text('NOT NOW', style: TextStyle(color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }
}

/// Shows the upgrade dialog.
Future<void> showUpgradeDialog(BuildContext context, String featureName) {
  return showDialog(
    context: context,
    builder: (context) => UpgradeDialog(featureName: featureName),
  );
}
