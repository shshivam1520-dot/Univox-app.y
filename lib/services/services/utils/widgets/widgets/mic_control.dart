import 'package:flutter/material.dart';

class MicControl extends StatelessWidget {
  final bool isListening;
  final VoidCallback onTap;

  const MicControl({
    super.key,
    required this.isListening,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: isListening ? Colors.redAccent : Colors.blueAccent,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: isListening
                  ? Colors.redAccent.withOpacity(0.6)
                  : Colors.blueAccent.withOpacity(0.6),
              blurRadius: 25,
              spreadRadius: 5,
            ),
          ],
        ),
        child: const Icon(Icons.mic, size: 64, color: Colors.white),
      ),
    );
  }
}
