import 'package:flutter/material.dart';
import '../design_system.dart';

/// Previews for the Soteria Design System Colors.
class ColorPreview extends StatelessWidget {
  const ColorPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = [
      ('Primary', Theme.of(context).colorScheme.primary),
      ('On Primary', Theme.of(context).colorScheme.onPrimary),
      ('Primary Container', Theme.of(context).colorScheme.primaryContainer),
      ('Secondary', Theme.of(context).colorScheme.secondary),
      ('Tertiary', Theme.of(context).colorScheme.tertiary),
      ('Error', Theme.of(context).colorScheme.error),
      ('Surface', Theme.of(context).colorScheme.surface),
      ('Outline', Theme.of(context).colorScheme.outline),
      ('Coin Gold', SoteriaColors.coinGold),
      ('XP Purple', SoteriaColors.xpPurple),
      ('Streak Orange', SoteriaColors.streakOrange),
      ('Success', SoteriaColors.success),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(SoteriaSpacing.s16),
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];
        return Card(
          child: ListTile(
            leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color.$2,
                borderRadius: BorderRadius.circular(SoteriaRadius.s),
                border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
              ),
            ),
            title: Text(color.$1),
            subtitle: Text(color.$2.toString().toUpperCase()),
          ),
        );
      },
    );
  }
}

/// Previews for the Soteria Design System Typography.
class TypographyPreview extends StatelessWidget {
  const TypographyPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return ListView(
      padding: const EdgeInsets.all(SoteriaSpacing.s16),
      children: [
        Text('Display Large', style: theme.displayLarge),
        Text('Display Medium', style: theme.displayMedium),
        Text('Display Small', style: theme.displaySmall),
        const Divider(height: 32),
        Text('Headline Large', style: theme.headlineLarge),
        Text('Headline Medium', style: theme.headlineMedium),
        Text('Headline Small', style: theme.headlineSmall),
        const Divider(height: 32),
        Text('Title Large', style: theme.titleLarge),
        Text('Title Medium', style: theme.titleMedium),
        Text('Title Small', style: theme.titleSmall),
        const Divider(height: 32),
        Text('Body Large', style: theme.bodyLarge),
        Text('Body Medium', style: theme.bodyMedium),
        Text('Body Small', style: theme.bodySmall),
        const Divider(height: 32),
        Text('Label Large', style: theme.labelLarge),
        Text('Label Medium', style: theme.labelMedium),
        Text('Label Small', style: theme.labelSmall),
      ],
    );
  }
}

/// Previews for the Soteria Design System Spacing.
class SpacingPreview extends StatelessWidget {
  const SpacingPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final scale = [
      ('s4', SoteriaSpacing.s4),
      ('s8', SoteriaSpacing.s8),
      ('s12', SoteriaSpacing.s12),
      ('s16', SoteriaSpacing.s16),
      ('s20', SoteriaSpacing.s20),
      ('s24', SoteriaSpacing.s24),
      ('s32', SoteriaSpacing.s32),
      ('s40', SoteriaSpacing.s40),
      ('s48', SoteriaSpacing.s48),
      ('s64', SoteriaSpacing.s64),
      ('s96', SoteriaSpacing.s96),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(SoteriaSpacing.s16),
      itemCount: scale.length,
      itemBuilder: (context, index) {
        final item = scale[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: SoteriaSpacing.s8),
          child: Row(
            children: [
              SizedBox(width: 60, child: Text(item.$1)),
              Container(
                height: 24,
                width: item.$2,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(width: SoteriaSpacing.s8),
              Text('${item.$2}px'),
            ],
          ),
        );
      },
    );
  }
}

/// Previews for the Soteria Design System Radius.
class RadiusPreview extends StatelessWidget {
  const RadiusPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final radii = [
      ('xs (4)', SoteriaRadius.xs),
      ('s (8)', SoteriaRadius.s),
      ('m (12)', SoteriaRadius.m),
      ('l (16)', SoteriaRadius.l),
      ('xl (28)', SoteriaRadius.xl),
      ('full', SoteriaRadius.full),
    ];

    return GridView.builder(
      padding: const EdgeInsets.all(SoteriaSpacing.s16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemCount: radii.length,
      itemBuilder: (context, index) {
        final r = radii[index];
        return Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(r.$2),
                  border: Border.all(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(r.$1),
          ],
        );
      },
    );
  }
}

/// Previews for the Soteria Design System Elevation & Shadows.
class ElevationPreview extends StatelessWidget {
  const ElevationPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final elevations = [
      ('Level 1', SoteriaElevation.level1, SoteriaShadows.low),
      ('Level 3', SoteriaElevation.level3, SoteriaShadows.medium),
      ('Level 5', SoteriaElevation.level5, SoteriaShadows.high),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(SoteriaSpacing.s16),
      itemCount: elevations.length,
      itemBuilder: (context, index) {
        final e = elevations[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(e.$1, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 12),
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(SoteriaRadius.m),
                  boxShadow: e.$3,
                ),
                child: Center(
                  child: Text('Shadow & Elevation ${e.$2}'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Previews for the Soteria Design System Icons.
class IconPreview extends StatelessWidget {
  const IconPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final icons = [
      SoteriaIcons.home,
      SoteriaIcons.school,
      SoteriaIcons.trophy,
      SoteriaIcons.person,
      SoteriaIcons.settings,
      SoteriaIcons.coin,
      SoteriaIcons.streak,
      SoteriaIcons.life,
      SoteriaIcons.reward,
      SoteriaIcons.search,
      SoteriaIcons.success,
      SoteriaIcons.warning,
      SoteriaIcons.error,
    ];

    return GridView.builder(
      padding: const EdgeInsets.all(SoteriaSpacing.s16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
      ),
      itemCount: icons.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Icon(icons[index], size: SoteriaIcons.l),
            const SizedBox(height: 8),
            const Text('Icon', style: TextStyle(fontSize: 10)),
          ],
        );
      },
    );
  }
}

/// Previews for the Soteria Design System Animations.
class AnimationPreview extends StatefulWidget {
  const AnimationPreview({super.key});

  @override
  State<AnimationPreview> createState() => _AnimationPreviewState();
}

class _AnimationPreviewState extends State<AnimationPreview> {
  bool _moved = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(SoteriaSpacing.s16),
      children: [
        ListTile(
          title: const Text('Tap to toggle Animation'),
          trailing: Switch(
            value: _moved,
            onChanged: (v) => setState(() => _moved = v),
          ),
        ),
        const SizedBox(height: 24),
        Text('Standard Curve (${SoteriaAnimations.medium.inMilliseconds}ms)', 
          style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 12),
        AnimatedAlign(
          duration: SoteriaAnimations.medium,
          curve: SoteriaAnimations.standard,
          alignment: _moved ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: SoteriaColors.primaryLight,
              borderRadius: BorderRadius.circular(SoteriaRadius.m),
            ),
          ),
        ),
        const SizedBox(height: 32),
        Text('Bounce Curve (${SoteriaAnimations.slow.inMilliseconds}ms)', 
          style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 12),
        AnimatedAlign(
          duration: SoteriaAnimations.slow,
          curve: SoteriaAnimations.bounce,
          alignment: _moved ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: SoteriaColors.streakOrange,
              borderRadius: BorderRadius.circular(SoteriaRadius.m),
            ),
          ),
        ),
      ],
    );
  }
}
