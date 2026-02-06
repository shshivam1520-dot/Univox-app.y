import 'package:flutter/material.dart';

class UnivoxFooter extends StatelessWidget {
  const UnivoxFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        "UNIVOX • Emotion + Speed + Intelligence",
        style: TextStyle(
          fontSize: 12,
          color: Colors.white.withOpacity(0.4),
          letterSpacing: 1.1,
        ),
      ),
    );
  }
}
