import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';

/// SoteriaLoadingState displays a centered loading indicator.
class SoteriaLoadingState extends StatelessWidget {
  const SoteriaLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}

/// SoteriaErrorState displays an error message and an optional retry button.
class SoteriaErrorState extends StatelessWidget {
  const SoteriaErrorState({
    super.key,
    required this.message,
    this.onRetry,
  });

  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(SoteriaSpacing.s24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: SoteriaColors.error),
            const SizedBox(height: SoteriaSpacing.s16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: SoteriaSpacing.s24),
              ElevatedButton(
                onPressed: onRetry,
                child: const Text('Retry'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// SoteriaEmptyState displays a message when no data is available.
class SoteriaEmptyState extends StatelessWidget {
  const SoteriaEmptyState({
    super.key,
    required this.title,
    this.message,
    this.icon = Icons.inbox_outlined,
  });

  final String title;
  final String? message;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(SoteriaSpacing.s24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 64, color: Colors.grey),
            const SizedBox(height: SoteriaSpacing.s16),
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            if (message != null) ...[
              const SizedBox(height: SoteriaSpacing.s8),
              Text(
                message!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey,
                    ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// SoteriaSkeleton is a placeholder widget for loading states.
class SoteriaSkeleton extends StatefulWidget {
  const SoteriaSkeleton({
    super.key,
    this.height,
    this.width,
    this.radius = SoteriaRadius.m,
  });

  final double? height;
  final double? width;
  final double radius;

  @override
  State<SoteriaSkeleton> createState() => _SoteriaSkeletonState();
}

class _SoteriaSkeletonState extends State<SoteriaSkeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween<double>(begin: 0.3, end: 0.7).animate(_controller),
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: Colors.grey.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(widget.radius),
        ),
      ),
    );
  }
}
