import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import '../../theme/tokens.dart';

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
          const SizedBox(height: AppSpacing.s),
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
            fillColor: enabled ? null : Colors.grey.withAlpha(25),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.m),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.m),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.m),
              borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.m),
              borderSide: const BorderSide(color: AppColors.danger),
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
  return const MaterialApp(
    home: Scaffold(
      body: Padding(
        padding: EdgeInsets.all(AppSpacing.m),
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
