import 'package:flutter/material.dart';

class DateDetailScreen extends StatelessWidget {
  const DateDetailScreen({super.key, required this.date});

  final String date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(date)));
  }
}
