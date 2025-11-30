import 'package:flutter/material.dart';
import '../tabs/decorate_tab_content.dart';
import '../tabs/mood_tab_content.dart';
import '../tabs/sound_tab_content.dart';

class StoryToolsPanel extends StatefulWidget {
  final ValueChanged<Color> onBackgroundColorChanged;

  const StoryToolsPanel({super.key, required this.onBackgroundColorChanged});

  @override
  State<StoryToolsPanel> createState() => _StoryToolsPanelState();
}

class _StoryToolsPanelState extends State<StoryToolsPanel> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1E2439),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            color: Colors.black.withAlpha(20),
            child: Row(
              children: [
                _buildTabItem("DECORATE", Icons.tag_faces_rounded, 0),
                _buildTabItem("MOOD", Icons.palette, 1),
                _buildTabItem("SOUND", Icons.music_note, 2),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // 탭 콘텐츠 영역
          Expanded(child: _buildTabContent()),

          const SizedBox(height: 16),
          // 저장 버튼
          _buildSaveButton(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "편집하기",
          style: TextStyle(
            color: Color(0xFFF1F5F9),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.close, color: Colors.grey),
          splashRadius: 25,
        ),
      ],
    );
  }

  Widget _buildTabItem(String label, IconData icon, int index) {
    final bool isSelected = _selectedTabIndex == index;
    final Color color = isSelected
        ? const Color(0xFFFCD34D)
        : const Color(0xFFCBD5E1);
    final Color backgroundColor = isSelected
        ? Colors.white.withAlpha(10)
        : Colors.transparent;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedTabIndex = index),
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(2),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: color, size: 16),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  color: color,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_selectedTabIndex) {
      case 0:
        return const DecorateTabContent();
      case 1:
        return MoodTabContent(onColorSelected: widget.onBackgroundColorChanged);
      case 2:
        return const SoundTabContent();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFFD54F),
          foregroundColor: Colors.black,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          "✔ Save Story",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}
