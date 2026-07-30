import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../design_system.dart';

/// Helper to copy token values to clipboard.
void _copyToClipboard(BuildContext context, String value) {
  Clipboard.setData(ClipboardData(text: value));
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Copied: $value'),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 1),
    ),
  );
}

/// Previews for the Soteria Design System Colors.
class ColorPreview extends StatelessWidget {
  const ColorPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = [
      ('Primary', SoteriaColors.primary, 'SoteriaColors.primary'),
      ('Secondary', SoteriaColors.secondary, 'SoteriaColors.secondary'),
      ('Gold', SoteriaColors.coinGold, 'SoteriaColors.coinGold'),
      ('Success', SoteriaColors.success, 'SoteriaColors.success'),
      ('Error', SoteriaColors.error, 'SoteriaColors.error'),
      ('Warning', SoteriaColors.warning, 'SoteriaColors.warning'),
      ('Background Dark', SoteriaColors.backgroundDark, 'SoteriaColors.backgroundDark'),
      ('Surface Dark', SoteriaColors.surfaceDark, 'SoteriaColors.surfaceDark'),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(SoteriaSpacing.s16),
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];
        return Card(
          child: ListTile(
            leading: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: color.$2,
                borderRadius: BorderRadius.circular(SoteriaRadius.s),
                border: Border.all(color: Colors.white10),
              ),
            ),
            title: Text(color.$1),
            subtitle: Text(color.$3),
            trailing: IconButton(
              icon: const Icon(Icons.copy_all, size: 20),
              onPressed: () => _copyToClipboard(context, color.$3),
            ),
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
      ('Primary Action', Icons.bolt_rounded),
      ('Reward', Icons.emoji_events_rounded),
      ('Achievement', Icons.workspace_premium_rounded),
      ('Streak', Icons.local_fire_department_rounded),
      ('Profile', Icons.person_rounded),
      ('Settings', Icons.settings_rounded),
      ('Notification', Icons.notifications_rounded),
      ('Search', Icons.search_rounded),
    ];

    return GridView.builder(
      padding: const EdgeInsets.all(SoteriaSpacing.s16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemCount: icons.length,
      itemBuilder: (context, index) {
        final icon = icons[index];
        return Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon.$2, size: 32, color: SoteriaColors.primary),
              const SizedBox(height: 8),
              Text(
                icon.$1,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 10),
              ),
            ],
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
    final styles = [
      ('Display Large', theme.displayLarge, 'theme.textTheme.displayLarge'),
      ('Headline Medium', theme.headlineMedium, 'theme.textTheme.headlineMedium'),
      ('Title Large', theme.titleLarge, 'theme.textTheme.titleLarge'),
      ('Body Large', theme.bodyLarge, 'theme.textTheme.bodyLarge'),
      ('Label Small', theme.labelSmall, 'theme.textTheme.labelSmall'),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(SoteriaSpacing.s16),
      itemCount: styles.length,
      itemBuilder: (context, index) {
        final s = styles[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(s.$1, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  IconButton(
                    icon: const Icon(Icons.copy, size: 16),
                    onPressed: () => _copyToClipboard(context, s.$3),
                  ),
                ],
              ),
              Text('The quick brown fox jumps over the lazy dog', style: s.$2),
              const SizedBox(height: 4),
              Text(
                'Size: ${s.$2?.fontSize} | Weight: ${s.$2?.fontWeight}',
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
              const Divider(),
            ],
          ),
        );
      },
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
      ('s16', SoteriaSpacing.s16),
      ('s24', SoteriaSpacing.s24),
      ('s32', SoteriaSpacing.s32),
      ('s64', SoteriaSpacing.s64),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(SoteriaSpacing.s16),
      itemCount: scale.length,
      itemBuilder: (context, index) {
        final item = scale[index];
        return ListTile(
          title: Text(item.$1),
          subtitle: Text('${item.$2}px'),
          leading: Container(
            height: 24,
            width: item.$2,
            color: SoteriaColors.primary,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.copy, size: 20),
            onPressed: () => _copyToClipboard(context, 'SoteriaSpacing.${item.$1}'),
          ),
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
      ('Level 1', SoteriaElevation.level1, SoteriaShadows.low, 'SoteriaShadows.low'),
      ('Level 3', SoteriaElevation.level3, SoteriaShadows.medium, 'SoteriaShadows.medium'),
      ('Level 5', SoteriaElevation.level5, SoteriaShadows.high, 'SoteriaShadows.high'),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(e.$1, style: Theme.of(context).textTheme.titleMedium),
                  IconButton(
                    icon: const Icon(Icons.copy, size: 20),
                    onPressed: () => _copyToClipboard(context, e.$4),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: SoteriaColors.surfaceDark,
                  borderRadius: BorderRadius.circular(SoteriaRadius.m),
                  boxShadow: e.$3,
                ),
                child: const Center(child: Text('Shadow Preview')),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Previews for the Soteria Design System Durations.
class DurationPreview extends StatelessWidget {
  const DurationPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final durations = [
      ('Fast', SoteriaAnimations.fast, 'SoteriaAnimations.fast'),
      ('Medium', SoteriaAnimations.medium, 'SoteriaAnimations.medium'),
      ('Slow', SoteriaAnimations.slow, 'SoteriaAnimations.slow'),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(SoteriaSpacing.s16),
      itemCount: durations.length,
      itemBuilder: (context, index) {
        final d = durations[index];
        return ListTile(
          title: Text(d.$1),
          subtitle: Text('${d.$2.inMilliseconds}ms'),
          trailing: IconButton(
            icon: const Icon(Icons.copy, size: 20),
            onPressed: () => _copyToClipboard(context, d.$3),
          ),
        );
      },
    );
  }
}
