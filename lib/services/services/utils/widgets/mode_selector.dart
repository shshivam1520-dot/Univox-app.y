import 'package:flutter/material.dart';
import '../models/mode.dart';

class ModeSelector extends StatelessWidget {
  final AppMode selectedMode;
  final ValueChanged<AppMode> onModeChanged;

  const ModeSelector({
    super.key,
    required this.selectedMode,
    required this.onModeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: AppMode.values.map((mode) {
          final bool isSelected = mode == selectedMode;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: ChoiceChip(
              label: Row(
                children: [
                  Icon(mode.icon, size: 16),
                  const SizedBox(width: 6),
                  Text(mode.label),
                ],
              ),
              selected: isSelected,
              onSelected: (_) => onModeChanged(mode),
            ),
          );
        }).toList(),
      ),
    );
  }
}
