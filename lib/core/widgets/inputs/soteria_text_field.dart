import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';

/// Type of text field to determine specific behaviors like obscure text.
enum SoteriaTextFieldType { standard, password, email, phone, multiline, search }

/// SoteriaTextField is the standard input component for the application.
class SoteriaTextField extends StatelessWidget {
  const SoteriaTextField({
    super.key,
    this.controller,
    this.label,
    this.hintText,
    this.type = SoteriaTextFieldType.standard,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.enabled = true,
    this.isLoading = false,
    this.autofillHints,
  });

  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final SoteriaTextFieldType type;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final bool enabled;
  final bool isLoading;
  final Iterable<String>? autofillHints;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: enabled ? null : Colors.grey,
                ),
          ),
          const SizedBox(height: SoteriaSpacing.s8),
        ],
        Semantics(
          label: label ?? hintText,
          textField: true,
          child: TextFormField(
            controller: controller,
            validator: validator,
            onChanged: onChanged,
            enabled: enabled && !isLoading,
            obscureText: type == SoteriaTextFieldType.password,
            keyboardType: _getKeyboardType(),
            autofillHints: autofillHints ?? _getAutofillHints(),
            maxLines: type == SoteriaTextFieldType.multiline ? 4 : 1,
            style: Theme.of(context).textTheme.bodyLarge,
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: prefixIcon,
              suffixIcon: _buildSuffixIcon(),
              filled: true,
              fillColor: enabled ? null : Colors.grey.withValues(alpha: 0.1),
              border: _buildBorder(),
              enabledBorder: _buildBorder(color: SoteriaColors.outlineLight),
              focusedBorder: _buildBorder(color: Theme.of(context).primaryColor, width: 2),
              errorBorder: _buildBorder(color: SoteriaColors.error),
              disabledBorder: _buildBorder(color: Colors.grey.withValues(alpha: 0.2)),
              contentPadding: const EdgeInsets.all(SoteriaSpacing.s16),
            ),
          ),
        ),
      ],
    );
  }

  TextInputType? _getKeyboardType() {
    switch (type) {
      case SoteriaTextFieldType.email: return TextInputType.emailAddress;
      case SoteriaTextFieldType.phone: return TextInputType.phone;
      case SoteriaTextFieldType.multiline: return TextInputType.multiline;
      default: return TextInputType.text;
    }
  }

  Iterable<String>? _getAutofillHints() {
    switch (type) {
      case SoteriaTextFieldType.email: return [AutofillHints.email];
      case SoteriaTextFieldType.password: return [AutofillHints.password];
      case SoteriaTextFieldType.phone: return [AutofillHints.telephoneNumber];
      default: return null;
    }
  }

  Widget? _buildSuffixIcon() {
    if (isLoading) {
      return const Padding(
        padding: EdgeInsets.all(SoteriaSpacing.s12),
        child: SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }
    return suffixIcon;
  }

  OutlineInputBorder _buildBorder({Color? color, double width = 1}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(SoteriaRadius.m),
      borderSide: color != null ? BorderSide(color: color, width: width) : BorderSide.none,
    );
  }
}
