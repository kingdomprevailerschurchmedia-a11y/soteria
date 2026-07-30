import 'package:flutter/material.dart';
import '../../../../core/design_system/design_system.dart';

class FairPlayIndicator extends StatelessWidget {
  final double integrityScore;
  final bool isVetting;

  const FairPlayIndicator({
    super.key,
    required this.integrityScore,
    this.isVetting = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = _getColor();
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(SoteriaRadius.full),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isVetting)
            const SizedBox(
              width: 12,
              height: 12,
              child: CircularProgressIndicator(strokeWidth: 2, valueColor: AlwaysStoppedAnimation(Colors.white54)),
            )
          else
            Icon(_getIcon(), size: 14, color: color),
          const SizedBox(width: 6),
          Text(
            _getLabel().toUpperCase(),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
        ],
      ),
    );
  }

  Color _getColor() {
    if (isVetting) return Colors.grey;
    if (integrityScore >= 0.9) return SoteriaColors.success;
    if (integrityScore >= 0.6) return SoteriaColors.warning;
    return SoteriaColors.error;
  }

  IconData _getIcon() {
    if (integrityScore >= 0.9) return Icons.verified_user_rounded;
    if (integrityScore >= 0.6) return Icons.gpp_maybe_rounded;
    return Icons.gpp_bad_rounded;
  }

  String _getLabel() {
    if (isVetting) return 'Vetting...';
    if (integrityScore >= 0.9) return 'Fair Play';
    if (integrityScore >= 0.6) return 'Reviewing';
    return 'Integrity Risk';
  }
}
