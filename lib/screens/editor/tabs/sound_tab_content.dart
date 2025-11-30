import 'package:flutter/material.dart';

class SoundTabContent extends StatefulWidget {
  const SoundTabContent({super.key});

  @override
  State<SoundTabContent> createState() => _SoundTabContentState();
}

class _SoundTabContentState extends State<SoundTabContent> {
  final TextEditingController _urlController = TextEditingController();
  bool _isValidating = false;

  void _validateYoutubeUrl() async {
    setState(() => _isValidating = true);
    // TODO: 실제 유튜브 링크 검증 로직 구현
    await Future.delayed(const Duration(seconds: 1)); // 시뮬레이션

    setState(() => _isValidating = false);

    if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("유효성 검사 완료 (로직 구현 필요)")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Background Music",
          style: TextStyle(color: Colors.white70, fontSize: 14),
        ),
        const SizedBox(height: 8),
        const Text(
          "YouTube URL을 입력하여 배경음악을 설정하세요.",
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: _urlController,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "https://youtu.be/...",
            hintStyle: TextStyle(color: Colors.grey[600]),
            filled: true,
            fillColor: Colors.black.withAlpha(50),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            prefixIcon: const Icon(Icons.link, color: Colors.grey),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton.icon(
            onPressed: _isValidating ? null : _validateYoutubeUrl,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3B82F6),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: _isValidating
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : const Icon(Icons.check_circle_outline),
            label: Text(_isValidating ? "검증 중..." : "URL 확인 및 적용"),
          ),
        ),
      ],
    );
  }
}
