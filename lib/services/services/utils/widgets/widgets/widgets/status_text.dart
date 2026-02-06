import 'package:flutter/material.dart';
import '../models/mode.dart';

class StatusText extends StatelessWidget {
  final bool isListening;
  final AppMode mode;
  final Map<String, int>? emotionData;
  final String speedStatus;

  const StatusText({
    super.key,
    required this.isListening,
    required this.mode,
    this.emotionData,
    this.speedStatus = "",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          isListening
              ? "Listening in ${mode.label} mode..."
              : "Tap mic to start listening",
          style: const TextStyle(fontSize: 16, color: Colors.white70),
        ),
        if (emotionData != null) ...emotionData!.entries.map(
          (e) => Text("${e.key}: ${e.value}%", style: const TextStyle(color: Colors.greenAccent)),
        ),
        if (speedStatus.isNotEmpty)
          Text(speedStatus, style: const TextStyle(color: Colors.orangeAccent)),
      ],
    );
  }
}
