// 에디터로 이동하기 위한 플로팅 버튼

import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class EditorActionButton extends StatelessWidget {
  const EditorActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.add,
      activeIcon: Icons.close,
      backgroundColor: Colors.blue,
      foregroundColor: Colors.amber,

      spacing: 12,
      spaceBetweenChildren: 8,

      children: [
        SpeedDialChild(
          child: const Icon(Icons.edit),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onTap: () {},
        ),
        SpeedDialChild(
          child: const Icon(Icons.camera_alt),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onTap: () {},
        ),
        SpeedDialChild(
          child: const Icon(Icons.music_note),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onTap: () {},
        ),
      ],
    );
  }
}
