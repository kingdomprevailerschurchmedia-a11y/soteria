import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';

/// SoteriaEmptyState displays a message when no data is available.
class SoteriaEmptyState extends StatelessWidget {
  const SoteriaEmptyState({
    super.key,
    required this.title,
    this.message,
    this.icon = Icons.inbox_outlined,
    this.action,
  });

  final String title;
  final String? message;
  final IconData icon;
  final Widget? action;

  // Static builders for specific common states
  static SoteriaEmptyState noInternet({Widget? action}) => SoteriaEmptyState(
    title: 'No Connection',
    message: 'Check your internet and try again.',
    icon: Icons.wifi_off_outlined,
    action: action,
  );

  static SoteriaEmptyState noResults() => const SoteriaEmptyState(
    title: 'No Results Found',
    message: 'Try adjusting your search filters.',
    icon: SoteriaIcons.search,
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(SoteriaSpacing.s32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 80, color: Colors.grey.shade400),
            const SizedBox(height: SoteriaSpacing.s24),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            if (message != null) ...[
              const SizedBox(height: SoteriaSpacing.s8),
              Text(
                message!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),
              ),
            ],
            if (action != null) ...[
              const SizedBox(height: SoteriaSpacing.s32),
              action!,
            ],
          ],
        ),
      ),
    );
  }
}
