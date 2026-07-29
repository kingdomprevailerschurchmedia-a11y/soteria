import 'package:flutter/material.dart';
import '../../core/widgets/containers/soteria_placeholder_screen.dart';

class VersusScreen extends StatelessWidget {
  const VersusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SoteriaPlaceholderScreen(
      title: 'Versus Mode',
      description: 'Challenge your friends to real-time 1v1 duels.',
      icon: Icons.bolt_outlined,
    );
  }
}
