import 'package:flutter/material.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/widgets/cards/soteria_tournament_card.dart';
import '../../domain/entities/tournament.dart';

class ActiveTournaments extends StatelessWidget {
  const ActiveTournaments({
    super.key,
    required this.tournaments,
  });

  final List<Tournament> tournaments;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: SoteriaSpacing.s16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'LIVE TOURNAMENTS',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('SEE ALL'),
              ),
            ],
          ),
        ),
        const SizedBox(height: SoteriaSpacing.s8),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: SoteriaSpacing.s8),
            itemCount: tournaments.length,
            itemBuilder: (context, index) {
              final t = tournaments[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: SoteriaSpacing.s8),
                child: SizedBox(
                  width: 280,
                  child: SoteriaTournamentCard(
                    title: t.title,
                    prizePool: t.prizePool,
                    timeLeft: t.timeLeft,
                    entryFee: t.entryFee,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
