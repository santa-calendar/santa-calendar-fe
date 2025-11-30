import 'package:flutter/material.dart';

class DecorateTabContent extends StatefulWidget {
  const DecorateTabContent({super.key});

  @override
  State<DecorateTabContent> createState() => _DecorateTabContentState();
}

class _DecorateTabContentState extends State<DecorateTabContent> {
  int _stickerCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: _buildDashedBoxButton(Icons.image_outlined, "Add Photo"),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildDashedBoxButton(Icons.text_fields, "Add Note"),
            ),
          ],
        ),
        const SizedBox(height: 16),

        _buildAiButton(),
        const SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "STICKERS",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                _buildCategoryBtn("기본", 0),
                const SizedBox(width: 8),
                _buildCategoryBtn("파스텔", 1),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),

        Expanded(
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(20),
              borderRadius: BorderRadius.circular(8),
            ),
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: 12,
              itemBuilder: (context, index) {
                // TODO: 실제 PNG 이미지로 교체 필요
                return _buildStickerItem(index);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDashedBoxButton(IconData icon, String label) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: const Color(0xFF252A40),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withAlpha(20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.grey[400], size: 24),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(color: Colors.grey[400], fontSize: 11)),
        ],
      ),
    );
  }

  Widget _buildAiButton() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          print("AI 추천 문구 클릭됨");
        },
        borderRadius: BorderRadius.circular(12),
        splashColor: const Color(0xFFA855F7).withOpacity(0.3),
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFA855F7), Color(0xFF3B82F6)],
            ).withOpacity(0.20),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withAlpha(10)),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.auto_awesome, color: Color(0xFFFFD54F), size: 18),
              SizedBox(width: 8),
              Text(
                "AI 추천 문구",
                style: TextStyle(
                  color: Color(0xFFFCD34D),
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryBtn(String label, int index) {
    final isSelected = _stickerCategoryIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _stickerCategoryIndex = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFCD34D) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? Colors.transparent
                : Colors.grey.withOpacity(0.5),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.grey,
            fontSize: 11,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildStickerItem(int index) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF252A40),
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Text(
        "Sticker\n$index",
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white24, fontSize: 10),
      ),
    );
  }
}
