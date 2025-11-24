import 'package:flutter/material.dart';
import 'package:santa_calendar_fe/models/date.dart';

final availableDates = List.generate(24, (i) {
  return Date(id: 'day_${i + 1}', date: '${i + 1}', color: Colors.black);
});
