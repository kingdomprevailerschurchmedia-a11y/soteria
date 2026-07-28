import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';

/// SoteriaDivider is a consistent horizontal line.
class SoteriaDivider extends StatelessWidget {
  const SoteriaDivider({
    super.key, 
    this.indent = 0, 
    this.endIndent = 0,
    this.height = 1,
    this.thickness,
  });

  final double indent;
  final double endIndent;
  final double height;
  final double? thickness;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      thickness: thickness ?? SoteriaBorders.thin,
      indent: indent,
      endIndent: endIndent,
      color: Theme.of(context).dividerColor.withValues(alpha: 0.1),
    );
  }
}
