import 'package:flutter/material.dart';

class DateSelector extends StatelessWidget {
  final int? selectedDate;
  final Function(int) onDateSelected;

  const DateSelector({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      style: MenuStyle(
        minimumSize: WidgetStateProperty.all(const Size(130, 0)),
        maximumSize: WidgetStateProperty.all(const Size(130, 200)),
      ),
      alignmentOffset: const Offset(0, 5),
      builder:
          (BuildContext context, MenuController controller, Widget? child) {
            return GestureDetector(
              onTap: () {
                if (controller.isOpen) {
                  controller.close();
                } else {
                  controller.open();
                }
              },
              child: Container(
                width: 110,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFD4E157),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedDate != null ? "$selectedDate일" : "날짜 선택",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.arrow_drop_down, size: 20),
                  ],
                ),
              ),
            );
          },
      menuChildren: List.generate(24, (index) {
        final day = index + 1;
        return MenuItemButton(
          style: ButtonStyle(
            fixedSize: WidgetStateProperty.all(const Size(110, 20)),
          ),
          onPressed: () => onDateSelected(day),
          child: Text("$day일"),
        );
      }),
    );
  }
}
