import 'package:flutter/material.dart';
import '../../../../core/design_system/design_system.dart';

class GameplayProgressBar extends StatelessWidget {
  const GameplayProgressBar({
    super.key,
    required this.progress,
    this.height = 4.0,
  });

  final double progress;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: SoteriaColors.surfaceL2,
        borderRadius: BorderRadius.circular(height / 2),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: progress.clamp(0.0, 1.0),
        child: Container(
          decoration: BoxDecoration(
            color: SoteriaColors.primary,
            borderRadius: BorderRadius.circular(height / 2),
            boxShadow: [
              BoxShadow(
                color: SoteriaColors.primary.withOpacity(0.5),
                blurRadius: 4,
                spreadRadius: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
