import 'package:flutter/material.dart';

class RegistrationStepIndicator extends StatelessWidget {
  const RegistrationStepIndicator({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  final int currentStep;
  final int totalSteps;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalSteps, (index) {
        final isActive = index <= currentStep;
        final isCompleted = index < currentStep;

        return Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: isActive ? Theme.of(context).primaryColor : Colors.grey.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: isCompleted
                    ? const Icon(Icons.check, size: 16, color: Colors.white)
                    : Text(
                        '${index + 1}',
                        style: TextStyle(
                          color: isActive ? Colors.white : Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
              ),
            ),
            if (index < totalSteps - 1)
              Container(
                width: 30,
                height: 2,
                color: index < currentStep ? Theme.of(context).primaryColor : Colors.grey.withValues(alpha: 0.2),
              ),
          ],
        );
      }),
    );
  }
}
