import 'package:flutter/material.dart';
import '../../core/theme/tokens.dart';
import 'widgets/component_preview_wrapper.dart';
import '../../core/widgets/shared/soteria_button.dart';
import '../../core/widgets/shared/soteria_card.dart';
import '../../core/widgets/shared/soteria_badge.dart';
import '../../core/widgets/forms/soteria_text_field.dart';
import '../../core/widgets/shared/soteria_states.dart';
import '../../core/widgets/shared/soteria_layout.dart';
import '../../core/widgets/shared/soteria_overlays.dart';
import '../../core/widgets/shared/soteria_components.dart';
import '../../core/widgets/forms/soteria_inputs.dart';
import '../../core/widgets/shared/feature_cards.dart';

/// GalleryScreen is the main entry point for the Developer Preview Gallery.
class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Developer Preview Gallery'),
      ),
      body: ListView(
        children: [
          _buildCategory(
            context,
            'Design System',
            [
              _buildItem(context, 'Colors', const ColorGallery()),
              _buildItem(context, 'Typography', const TypographyGallery()),
            ],
          ),
          _buildCategory(
            context,
            'Shared Components',
            [
              _buildItem(context, 'Buttons', const ButtonGallery()),
              _buildItem(context, 'Cards', const CardGallery()),
              _buildItem(context, 'Badges & Tags', const BadgeGallery()),
              _buildItem(context, 'Avatars', const AvatarGallery()),
              _buildItem(context, 'Section Header', const SectionHeaderGallery()),
            ],
          ),
          _buildCategory(
            context,
            'Forms',
            [
              _buildItem(context, 'TextFields', const TextFieldGallery()),
              _buildItem(context, 'Selection Controls', const InputGallery()),
            ],
          ),
          _buildCategory(
            context,
            'States',
            [
              _buildItem(context, 'Loading', const SoteriaLoadingState()),
              _buildItem(context, 'Error', const SoteriaErrorState(message: 'Something went wrong')),
              _buildItem(context, 'Empty', const SoteriaEmptyState(title: 'No Data')),
              _buildItem(context, 'Skeleton', const SkeletonGallery()),
            ],
          ),
          _buildCategory(
            context,
            'Overlays',
            [
              _buildItem(context, 'SnackBar', const SnackBarGallery()),
              _buildItem(context, 'Dialogs', const DialogGallery()),
              _buildItem(context, 'Bottom Sheets', const BottomSheetGallery()),
            ],
          ),
          _buildCategory(
            context,
            'Feature Components',
            [
              _buildItem(context, 'Quiz Card', const QuizCard(title: 'General Knowledge', questionCount: 20, difficulty: 'Medium')),
              _buildItem(context, 'Wallet Card', const WalletCard(balance: '₦25,000.00')),
              _buildItem(context, 'Achievement Card', const AchievementCard(title: 'Top Learner', description: 'Complete 10 quizzes with 100% score', icon: Icons.emoji_events)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategory(BuildContext context, String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
          ),
        ),
        ...items,
        const Divider(),
      ],
    );
  }

  Widget _buildItem(BuildContext context, String name, Widget component) {
    return ListTile(
      title: Text(name),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ComponentPreviewWrapper(
              component: component,
              name: name,
            ),
          ),
        );
      },
    );
  }
}

// --- Specific Galleries ---

class ColorGallery extends StatelessWidget {
  const ColorGallery({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = [
      ('Primary', Theme.of(context).colorScheme.primary),
      ('Primary Container', Theme.of(context).colorScheme.primaryContainer),
      ('Secondary', Theme.of(context).colorScheme.secondary),
      ('Error', Theme.of(context).colorScheme.error),
      ('Surface', Theme.of(context).colorScheme.surface),
      ('Success', AppColors.success),
      ('Warning', AppColors.warning),
      ('Info', AppColors.info),
    ];

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];
        return ListTile(
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.$2,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.grey.withOpacity(0.2)),
            ),
          ),
          title: Text(color.$1),
          subtitle: Text(color.$2.toString()),
        );
      },
    );
  }
}

class TypographyGallery extends StatelessWidget {
  const TypographyGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Display Large', style: Theme.of(context).textTheme.displayLarge),
        Text('Headline Large', style: Theme.of(context).textTheme.headlineLarge),
        Text('Title Large', style: Theme.of(context).textTheme.titleLarge),
        Text('Body Large', style: Theme.of(context).textTheme.bodyLarge),
        Text('Label Large', style: Theme.of(context).textTheme.labelLarge),
      ],
    );
  }
}

class ButtonGallery extends StatelessWidget {
  const ButtonGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SoteriaButton(label: 'Primary', onPressed: () {}),
        const SizedBox(height: 16),
        SoteriaButton(label: 'Secondary', type: SoteriaButtonType.secondary, onPressed: () {}),
        const SizedBox(height: 16),
        SoteriaButton(label: 'Outlined', type: SoteriaButtonType.outlined, onPressed: () {}),
        const SizedBox(height: 16),
        SoteriaButton(label: 'Text', type: SoteriaButtonType.text, onPressed: () {}),
        const SizedBox(height: 16),
        SoteriaButton(label: 'With Icon', icon: Icons.add, onPressed: () {}),
        const SizedBox(height: 16),
        SoteriaButton(label: 'Loading', isLoading: true, onPressed: () {}),
        const SizedBox(height: 16),
        SoteriaButton(label: 'Disabled', isDisabled: true, onPressed: () {}),
      ],
    );
  }
}

class CardGallery extends StatelessWidget {
  const CardGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SoteriaCard(child: Text('Default Card')),
        const SizedBox(height: 16),
        SoteriaCard(
          color: Theme.of(context).colorScheme.primaryContainer,
          child: const Text('Primary Container Card'),
        ),
      ],
    );
  }
}

class BadgeGallery extends StatelessWidget {
  const BadgeGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Wrap(
            spacing: 8,
            children: [
              SoteriaBadge(label: 'Primary'),
              SoteriaBadge(label: 'Success', color: AppColors.success),
              SoteriaBadge(label: 'Danger', color: AppColors.danger),
            ],
          ),
          const SizedBox(height: 24),
          const Wrap(
            spacing: 8,
            children: [
              SoteriaTag(label: 'TRENDING', color: Colors.blue),
              SoteriaTag(label: 'HOT', color: Colors.red),
              SoteriaTag(label: 'NEW', color: Colors.green),
            ],
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 8,
            children: [
              const SoteriaChip(label: 'Unselected'),
              SoteriaChip(label: 'Selected', isSelected: true, onSelected: (v) {}),
            ],
          ),
        ],
      ),
    );
  }
}

class AvatarGallery extends StatelessWidget {
  const AvatarGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Wrap(
        spacing: 16,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          SoteriaAvatar(initials: 'JD'),
          SoteriaAvatar(initials: 'AS', size: 64),
          SoteriaAvatar(
            imageUrl: 'https://i.pravatar.cc/150?u=soteria',
            size: 80,
          ),
        ],
      ),
    );
  }
}

class TextFieldGallery extends StatelessWidget {
  const TextFieldGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SoteriaTextField(label: 'Default', hintText: 'Enter text'),
        const SizedBox(height: 16),
        const SoteriaTextField(
          label: 'Password',
          obscureText: true,
          hintText: 'Enter password',
          suffixIcon: Icon(Icons.visibility_off),
        ),
        const SizedBox(height: 16),
        const SoteriaTextField(
          label: 'With Icon',
          hintText: 'Search...',
          prefixIcon: Icon(Icons.search),
        ),
        const SizedBox(height: 16),
        const SoteriaTextField(
          label: 'Disabled',
          enabled: false,
          hintText: 'I am disabled',
        ),
      ],
    );
  }
}

class InputGallery extends StatelessWidget {
  const InputGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SoteriaDropdown<String>(
          label: 'Dropdown',
          value: 'Option 1',
          items: const [
            DropdownMenuItem(value: 'Option 1', child: Text('Option 1')),
            DropdownMenuItem(value: 'Option 2', child: Text('Option 2')),
          ],
          onChanged: (v) {},
        ),
        const SizedBox(height: 16),
        SoteriaSwitch(label: 'Toggle Switch', value: true, onChanged: (v) {}),
        const SizedBox(height: 16),
        SoteriaCheckbox(label: 'Checkbox Label', value: true, onChanged: (v) {}),
      ],
    );
  }
}

class SkeletonGallery extends StatelessWidget {
  const SkeletonGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SoteriaSkeleton(height: 20, width: 200),
        const SizedBox(height: 16),
        const SoteriaSkeleton(height: 100),
        const SizedBox(height: 16),
        Row(
          children: [
            const SoteriaSkeleton(height: 50, width: 50, radius: 25),
            const SizedBox(width: 16),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SoteriaSkeleton(height: 15, width: 150),
                SizedBox(height: 8),
                SoteriaSkeleton(height: 15, width: 100),
              ],
            )
          ],
        )
      ],
    );
  }
}

class SectionHeaderGallery extends StatelessWidget {
  const SectionHeaderGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SoteriaSectionHeader(title: 'Recent Activity'),
        const SoteriaDivider(),
        SoteriaSectionHeader(
          title: 'Upcoming Tournaments',
          actionLabel: 'See All',
          onActionPressed: () {},
        ),
      ],
    );
  }
}

class SnackBarGallery extends StatelessWidget {
  const SnackBarGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => SoteriaOverlays.showSnackBar(context, message: 'Operation Successful!'),
            child: const Text('Show Success SnackBar'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => SoteriaOverlays.showSnackBar(
              context,
              message: 'Something went wrong!',
              isError: true,
            ),
            child: const Text('Show Error SnackBar'),
          ),
        ],
      ),
    );
  }
}

class DialogGallery extends StatelessWidget {
  const DialogGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => SoteriaOverlays.showConfirmationDialog(
              context,
              title: 'Confirm Action',
              message: 'Are you sure you want to proceed?',
            ),
            child: const Text('Show Confirmation Dialog'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => SoteriaOverlays.showConfirmationDialog(
              context,
              title: 'Delete Item',
              message: 'This action cannot be undone.',
              isDangerous: true,
              confirmLabel: 'Delete',
            ),
            child: const Text('Show Dangerous Dialog'),
          ),
        ],
      ),
    );
  }
}

class BottomSheetGallery extends StatelessWidget {
  const BottomSheetGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => SoteriaOverlays.showBottomSheet(
          context,
          title: 'Select Option',
          child: ListView(
            shrinkWrap: true,
            children: [
              ListTile(leading: const Icon(Icons.share), title: const Text('Share'), onTap: () {}),
              ListTile(leading: const Icon(Icons.link), title: const Text('Copy Link'), onTap: () {}),
              ListTile(leading: const Icon(Icons.edit), title: const Text('Edit'), onTap: () {}),
            ],
          ),
        ),
        child: const Text('Show Bottom Sheet'),
      ),
    );
  }
}
