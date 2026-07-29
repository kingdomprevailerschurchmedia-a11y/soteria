import 'package:flutter/material.dart';

class CountdownTimerWidget extends StatelessWidget {
  const CountdownTimerWidget({super.key, required this.seconds, required this.onResend});
  final int seconds;
  final VoidCallback onResend;

  @override
  Widget build(BuildContext context) {
    final canResend = seconds <= 0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (!canResend) ...[
          const Icon(Icons.timer_outlined, size: 14, color: Colors.grey),
          const SizedBox(width: 4),
          Text(
            'Resend in ${seconds}s',
            style: const TextStyle(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.bold),
          ),
        ] else
          TextButton(
            onPressed: onResend,
            child: Text(
              'RESEND CODE',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.1,
              ),
            ),
          ),
      ],
    );
  }
}
