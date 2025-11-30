import 'package:flutter/material.dart';

class StoryPreviewArea extends StatelessWidget {
  final Color backgroundColor;

  const StoryPreviewArea({super.key, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 24,
            left: 24,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0x00000000).withAlpha(30),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xFFFFFFFF).withAlpha(10),
                ),
              ),
              child: const Text(
                "Day 12 Record",
                style: TextStyle(
                  color: Color(0xFFFCD34D),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
