import 'package:flutter/material.dart';
import 'package:santa_calendar_fe/screens/editor/components/date_selector.dart';
import 'package:santa_calendar_fe/screens/editor/components/type_button.dart';
import 'package:santa_calendar_fe/screens/editor/components/type_choice.dart';

enum MenuType {
  image('이미지', Icons.image),
  youtube('유튜브', Icons.video_library),
  theme('테마', Icons.color_lens);

  const MenuType(this.label, this.icon);
  final String label;
  final IconData icon;
}

class EditorScreen extends StatefulWidget {
  const EditorScreen({super.key});

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  int? _selectedDate;
  final MenuType _selectedType = MenuType.image;

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("스티커 영역"),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("닫기"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: Text(
          _selectedDate != null ? "$_selectedDate일 수정" : "날짜를 선택해주세요",
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ),
        elevation: 0,
        shape: const Border(bottom: BorderSide(color: Colors.black, width: 1)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: AspectRatio(
            aspectRatio: 3 / 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                children: [
                  Positioned.fill(child: Container(color: Colors.grey[300])),
                  Positioned(
                    top: 16,
                    left: 16,
                    right: 16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DateSelector(
                          selectedDate: _selectedDate,
                          onDateSelected: (newDate) {
                            setState(() {
                              _selectedDate = newDate;
                            });
                          },
                        ),
                        if (_selectedDate != null) TypeChoice(),
                      ],
                    ),
                  ),

                  Center(
                    child: Text(
                      _selectedDate == null ? "날짜를 선택해주세요" : "",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 16,
                    right: 16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildOptionButton(
                              text: "Text",
                              color: const Color(0xFFFF8A80),
                              width: 50,
                              height: 50,
                            ),
                            const SizedBox(height: 8),
                            _buildOptionButton(
                              onTap: _showBottomSheet,
                              text: "스티커",
                              color: const Color(0xFFFF5252),
                              width: 80,
                              height: 40,
                              textColor: Colors.white,
                            ),
                          ],
                        ),
                        _buildOptionButton(
                          text: "발행",
                          color: const Color(0xFFFF8A65),
                          width: 70,
                          height: 45,
                          isBold: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOptionButton({
    required String text,
    required Color color,
    required double width,
    required double height,
    Color textColor = Colors.black,
    bool isBold = false,
    VoidCallback? onTap,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          color: color,
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 12,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
