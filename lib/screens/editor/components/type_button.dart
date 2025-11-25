import 'package:flutter/material.dart';
import 'package:santa_calendar_fe/screens/editor/editor_screen.dart';

class TypeButton extends StatelessWidget {
  final MenuType type;
  final bool isSelected;
  final VoidCallback onTap;

  const TypeButton({
    super.key,
    required this.type,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color baseColor = const Color(0xFFD4E157);
    final Color activeColor = Colors.green;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(color: isSelected ? activeColor : baseColor),
        child: Text(
          type.label,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
