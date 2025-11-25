// 에디터로 이동하기 위한 플로팅 버튼

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditorActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        print("플로팅 버튼");
      },
    );
  }
}
