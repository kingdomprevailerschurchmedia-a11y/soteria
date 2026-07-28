import 'package:flutter/material.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/widgets/avatars/soteria_avatar.dart';

class AvatarPicker extends StatelessWidget {
  const AvatarPicker({
    super.key,
    required this.selectedId,
    required this.onSelected,
  });

  final String? selectedId;
  final ValueChanged<String> onSelected;

  static const _defaultAvatars = [
    {'id': 'avatar_1', 'initials': 'S1'},
    {'id': 'avatar_2', 'initials': 'S2'},
    {'id': 'avatar_3', 'initials': 'S3'},
    {'id': 'avatar_4', 'initials': 'S4'},
    {'id': 'avatar_5', 'initials': 'S5'},
    {'id': 'avatar_6', 'initials': 'S6'},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: SoteriaSpacing.s16,
        mainAxisSpacing: SoteriaSpacing.s16,
      ),
      itemCount: _defaultAvatars.length,
      itemBuilder: (context, index) {
        final avatar = _defaultAvatars[index];
        final isSelected = selectedId == avatar['id'];

        return GestureDetector(
          onTap: () => onSelected(avatar['id']!),
          child: AnimatedContainer(
            duration: SoteriaAnimations.fast,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? Theme.of(context).primaryColor : Colors.transparent,
                width: 3,
              ),
            ),
            padding: const EdgeInsets.all(4),
            child: SoteriaAvatar(
              initials: avatar['initials'],
              size: 80,
            ),
          ),
        );
      },
    );
  }
}
