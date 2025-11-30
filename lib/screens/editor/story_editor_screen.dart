import 'package:flutter/material.dart';
import 'components/story_preview_area.dart';
import 'components/story_tools_panel.dart';

class StoryEditorScreen extends StatefulWidget {
  const StoryEditorScreen({super.key});

  @override
  State<StoryEditorScreen> createState() => _StoryEditorScreenState();
}

class _StoryEditorScreenState extends State<StoryEditorScreen> {
  Color _previewBackgroundColor = const Color(0xFF64748B);

  void _updateBackgroundColor(Color color) {
    setState(() {
      _previewBackgroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF000000).withAlpha(80),
      body: Center(
        child: Container(
          width: screenWidth * 0.9,
          height: screenHeight * 0.9,
          constraints: const BoxConstraints(maxWidth: 896, maxHeight: 900),
          decoration: BoxDecoration(
            color: const Color(0xFF94A3B8),
            borderRadius: BorderRadius.circular(16),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: StoryPreviewArea(
                    backgroundColor: _previewBackgroundColor,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: StoryToolsPanel(
                    onBackgroundColorChanged: _updateBackgroundColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
