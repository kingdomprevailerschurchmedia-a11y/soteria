import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import '../../design_system/design_system.dart';

/// SoteriaTextField is a custom input field with consistent styling.
class SoteriaTextField extends StatelessWidget {
  const SoteriaTextField({
    super.key,
    this.controller,
    this.label,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
    this.enabled = true,
    this.onChanged,
  });

  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool enabled;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: SoteriaSpacing.s8),
        ],
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          validator: validator,
          enabled: enabled,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: enabled ? null : Colors.grey.withValues(alpha: 0.1),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(SoteriaRadius.m),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(SoteriaRadius.m),
              borderSide: const BorderSide(color: SoteriaColors.outlineLight),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(SoteriaRadius.m),
              borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(SoteriaRadius.m),
              borderSide: const BorderSide(color: SoteriaColors.error),
            ),
          ),
        ),
      ],
    );
  }
}

// --- Previews ---

@Preview(name: 'TextField - Default')
Widget textFieldPreview() {
  return MaterialApp(
    theme: SoteriaTheme.light,
    home: const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(SoteriaSpacing.s16),
        child: Center(
          child: SoteriaTextField(
            label: 'Email Address',
            hintText: 'Enter your email',
            prefixIcon: Icon(Icons.email_outlined),
          ),
        ),
      ),
    ),
  );
}
