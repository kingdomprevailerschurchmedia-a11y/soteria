import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/design_system/design_system.dart';
import '../../../../../core/widgets/buttons/soteria_button.dart';
import '../../../../../core/navigation/navigation_constants.dart';

class ExpiredSessionDialog extends StatelessWidget {
  const ExpiredSessionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SoteriaRadius.l)),
      child: Padding(
        padding: const EdgeInsets.all(SoteriaSpacing.s32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.timer_off_outlined, size: 64, color: SoteriaColors.error),
            const SizedBox(height: SoteriaSpacing.s24),
            Text(
              'Session Expired',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: SoteriaSpacing.s16),
            const Text(
              'Your scholarly session has expired for security reasons. Please log in again to continue your progress.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: SoteriaSpacing.s40),
            SoteriaButton(
              onPressed: () {
                context.pop();
                context.pushNamed(NavigationConstants.loginName);
              },
              label: 'LOG IN AGAIN',
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> showExpiredSessionDialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const ExpiredSessionDialog(),
  );
}
