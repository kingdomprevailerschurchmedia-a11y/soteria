import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';

/// SoteriaCircularLoader is a high-polish loading indicator.
class SoteriaCircularLoader extends StatelessWidget {
  const SoteriaCircularLoader({super.key, this.size = 24});
  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: const CircularProgressIndicator.adaptive(),
      ),
    );
  }
}

/// SoteriaSkeleton is a placeholder for content that is still loading.
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
      duration: SoteriaAnimations.extraSlow,
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
