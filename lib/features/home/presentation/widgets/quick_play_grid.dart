import 'package:flutter/material.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/widgets/cards/soteria_feature_card.dart';

class QuickPlayGrid extends StatelessWidget {
  const QuickPlayGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SoteriaSpacing.s16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'QUICK PLAY',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
          ),
          const SizedBox(height: SoteriaSpacing.s16),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: SoteriaSpacing.s16,
            crossAxisSpacing: SoteriaSpacing.s16,
            childAspectRatio: 0.9,
            children: [
              SoteriaFeatureCard(
                title: 'Practice',
                description: 'Sharpen your skills solo',
                icon: SoteriaIcons.school,
                color: Colors.blue,
                onTap: () {},
              ),
              SoteriaFeatureCard(
                title: 'Versus',
                description: 'Real-time 1v1 duels',
                icon: Icons.bolt,
                color: SoteriaColors.streakOrange,
                onTap: () {},
              ),
              SoteriaFeatureCard(
                title: 'Leaderboard',
                description: 'Check your standing',
                icon: SoteriaIcons.trophy,
                color: SoteriaColors.xpPurple,
                onTap: () {},
              ),
              SoteriaFeatureCard(
                title: 'Store',
                description: 'Redeem your coins',
                icon: SoteriaIcons.coin,
                color: SoteriaColors.coinGold,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
