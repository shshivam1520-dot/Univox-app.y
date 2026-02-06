import 'package:flutter/material.dart';
import 'models/mode.dart';
import 'services/emotion_service.dart';
import 'services/speed_service.dart';
import 'widgets/mode_selector.dart';
import 'widgets/mic_control.dart';
import 'widgets/status_text.dart';
import 'widgets/footer.dart';

void main() {
  runApp(const UnivoxApp());
}

final emotionService = EmotionService();
final speedService = SpeedService();

class UnivoxApp extends StatelessWidget {
  const UnivoxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UNIVOX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const AppShell(),
    );
  }
}

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  AppMode currentMode = AppMode.student;
  bool isListening = false;
  Map<String, int>? emotionData;

  void toggleListening() {
    setState(() {
      isListening = !isListening;
      if (isListening) {
        // Mock emotion analysis
        emotionData = emotionService.analyzeEmotion("mock_audio_data");
      } else {
        emotionData = null;
      }
    });
  }

  void changeMode(AppMode mode) {
    setState(() {
      currentMode = mode;
    });
  }

  void increaseSpeed() {
    setState(() {
      speedService.setSpeed(speedService.speed + 0.1);
    });
  }

  void decreaseSpeed() {
    setState(() {
      speedService.setSpeed(speedService.speed - 0.1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UNIVOX"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Chip(label: Text(currentMode.label)),
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          ModeSelector(selectedMode: currentMode, onModeChanged: changeMode),
          const Spacer(),
          MicControl(isListening: isListening, onTap: toggleListening),
          const SizedBox(height: 16),
          StatusText(
            isListening: isListening,
            mode: currentMode,
            emotionData: emotionData,
            speedStatus: speedService.status(),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: decreaseSpeed,
                icon: const Icon(Icons.remove_circle),
                color: Colors.orangeAccent,
              ),
              const SizedBox(width: 12),
              IconButton(
                onPressed: increaseSpeed,
                icon: const Icon(Icons.add_circle),
                color: Colors.orangeAccent,
              ),
            ],
          ),
          const Spacer(),
          const UnivoxFooter(),
        ],
      ),
    );
  }
}
