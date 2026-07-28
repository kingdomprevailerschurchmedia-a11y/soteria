import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';

/// SoteriaListTile is a stylized list item component.
class SoteriaListTile extends StatelessWidget {
  const SoteriaListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.isLoading = false,
  });

  final String title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const _SoteriaListTileSkeleton();
    }

    return ListTile(
      onTap: onTap,
      leading: leading,
      title: Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
      subtitle: subtitle != null ? Text(subtitle!, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey)) : null,
      trailing: trailing ?? const Icon(SoteriaIcons.chevronRight, size: 16),
      contentPadding: const EdgeInsets.symmetric(horizontal: SoteriaSpacing.s16, vertical: SoteriaSpacing.s4),
    );
  }
}

class _SoteriaListTileSkeleton extends StatelessWidget {
  const _SoteriaListTileSkeleton();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(backgroundColor: Colors.grey),
      title: Container(height: 12, width: 100, color: Colors.grey),
      subtitle: Container(height: 10, width: 150, color: Colors.grey),
    );
  }
}
