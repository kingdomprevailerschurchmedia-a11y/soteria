import 'package:flutter/material.dart';

/// A utility widget that handles staggered fade and slide animations for text elements.
class SoteriaStaggeredFade extends StatelessWidget {
  const SoteriaStaggeredFade({
    super.key,
    required this.child,
    required this.animation,
    this.offset = 20.0,
  });

  final Widget child;
  final Animation<double> animation;
  final double offset;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        final opacity = animation.value;
        final slideTranslate = offset * (1.0 - opacity);

        return Opacity(
          opacity: opacity,
          child: Transform.translate(
            offset: Offset(0, slideTranslate),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
