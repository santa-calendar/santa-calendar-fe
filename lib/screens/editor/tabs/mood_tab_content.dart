import 'package:flutter/material.dart';

class MoodTabContent extends StatelessWidget {
  final ValueChanged<Color> onColorSelected;

  const MoodTabContent({super.key, required this.onColorSelected});

  final List<Color> _moodColors = const [
    Color(0xFF64748B),
    Color(0xFFEF4444),
    Color(0xFFF59E0B),
    Color(0xFF10B981),
    Color(0xFF3B82F6),
    Color(0xFF8B5CF6),
    Color(0xFFEC4899),
    Color(0xFF1E293B),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Select Background Mood",
          style: TextStyle(color: Colors.white70, fontSize: 14),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: _moodColors.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => onColorSelected(_moodColors[index]),
                child: Container(
                  decoration: BoxDecoration(
                    color: _moodColors[index],
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white24, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(30),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
