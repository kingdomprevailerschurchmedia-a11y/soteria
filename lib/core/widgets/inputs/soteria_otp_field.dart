import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../design_system/design_system.dart';

/// SoteriaOtpField is a specialized input for One-Time Passwords.
class SoteriaOtpField extends StatelessWidget {
  const SoteriaOtpField({
    super.key,
    required this.length,
    this.onChanged,
    this.onCompleted,
    this.enabled = true,
  });

  final int length;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onCompleted;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        length,
        (index) => SizedBox(
          width: 50,
          height: 60,
          child: TextFormField(
            enabled: enabled,
            onChanged: (value) {
              if (value.length == 1 && index < length - 1) {
                FocusScope.of(context).nextFocus();
              }
              if (value.isEmpty && index > 0) {
                FocusScope.of(context).previousFocus();
              }
              onChanged?.call(value);
            },
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(SoteriaRadius.m),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(SoteriaRadius.m),
                borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
