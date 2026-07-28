import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';

/// SoteriaBottomSheet provides a container for content that slides up from the bottom.
class SoteriaBottomSheet extends StatelessWidget {
  const SoteriaBottomSheet({
    super.key,
    required this.child,
    this.title,
    this.showDragHandle = true,
  });

  final Widget child;
  final String? title;
  final bool showDragHandle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + SoteriaSpacing.s24,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(SoteriaRadius.xl)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showDragHandle) ...[
            const SizedBox(height: SoteriaSpacing.s12),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
          if (title != null) ...[
            Padding(
              padding: const EdgeInsets.all(SoteriaSpacing.s24),
              child: Text(
                title!,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(height: 1),
          ],
          child,
        ],
      ),
    );
  }
}
