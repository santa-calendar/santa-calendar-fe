import 'package:flutter/material.dart';

class Date {
  const Date ({
    required this.id,
    required this.date,
    this.color = Colors.amber,
  });

  final String id;
  final String date;
  final Color color;
}