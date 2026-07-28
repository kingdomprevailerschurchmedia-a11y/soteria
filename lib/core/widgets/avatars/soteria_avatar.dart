import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';

/// SoteriaAvatar displays a user image or initials with optional status.
class SoteriaAvatar extends StatelessWidget {
  const SoteriaAvatar({
    super.key,
    this.imageUrl,
    this.initials,
    this.size = 40,
    this.isOnline = false,
    this.showStatus = false,
  });

  final String? imageUrl;
  final String? initials;
  final double size;
  final bool isOnline;
  final bool showStatus;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildAvatar(context),
        if (showStatus)
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: size * 0.25,
              height: size * 0.25,
              decoration: BoxDecoration(
                color: isOnline ? SoteriaColors.success : Colors.grey,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildAvatar(BuildContext context) {
    return CircleAvatar(
      radius: size / 2,
      backgroundColor: Theme.of(context).primaryColor.withValues(alpha: 0.1),
      backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
      child: imageUrl == null && initials != null
          ? Text(
              initials!.toUpperCase(),
              style: TextStyle(
                fontSize: size * 0.4,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            )
          : null,
    );
  }
}
