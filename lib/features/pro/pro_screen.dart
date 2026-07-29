import 'package:flutter/material.dart';
import '../../core/widgets/containers/soteria_placeholder_screen.dart';

class ProScreen extends StatelessWidget {
  const ProScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SoteriaPlaceholderScreen(
      title: 'Pro Mode',
      description: 'Get certified with high-stakes professional examinations.',
      icon: Icons.star_outline,
    );
  }
}
