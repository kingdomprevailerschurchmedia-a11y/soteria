import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/widgets/buttons/soteria_button.dart';
import '../../../../core/navigation/navigation_constants.dart';
import '../../application/recovery_controller.dart';

class RecoverySuccessScreen extends ConsumerWidget {
  const RecoverySuccessScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(SoteriaSpacing.s32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(SoteriaSpacing.s32),
                decoration: BoxDecoration(
                  color: SoteriaColors.success.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check_circle_outline_rounded, size: 80, color: SoteriaColors.success),
              ),
              const SizedBox(height: SoteriaSpacing.s48),
              Text(
                'Password Reset Successful',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: SoteriaSpacing.s16),
              Text(
                'Your scholarly account is now secure with a new password. You can now log in and resume your journey.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey.shade600, height: 1.5),
              ),
              const SizedBox(height: SoteriaSpacing.s80),
              SoteriaButton(
                onPressed: () {
                  ref.read(recoveryControllerProvider.notifier).reset();
                  context.goNamed(NavigationConstants.loginName);
                },
                label: 'BACK TO LOGIN',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
