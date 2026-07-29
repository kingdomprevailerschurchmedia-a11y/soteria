import 'package:flutter/material.dart';
import '../../../../../core/design_system/design_system.dart';

class RecoveryStepIndicator extends StatelessWidget {
  const RecoveryStepIndicator({super.key, required this.currentStep});
  final int currentStep;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        final isActive = index <= currentStep;
        final isCompleted = index < currentStep;

        return Row(
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: isCompleted 
                  ? SoteriaColors.success 
                  : (isActive ? Theme.of(context).primaryColor : Colors.grey.withValues(alpha: 0.2)),
                shape: BoxShape.circle,
              ),
            ),
            if (index < 2)
              Container(
                width: 20,
                height: 2,
                color: isCompleted ? SoteriaColors.success : Colors.grey.withValues(alpha: 0.2),
              ),
          ],
        );
      }),
    );
  }
}
