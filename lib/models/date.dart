import 'package:flutter/material.dart';

enum DateState {
  locked, // 열 수 없음
  openable, // 열 수 있음
  opened, // 이미 봄
}

class Date {
  const Date({
    required this.id,
    required this.date,
    required this.state,
    this.color = Colors.amber,
  });

  final String id;
  final String date;
  final DateState state;
  final Color color;
}
