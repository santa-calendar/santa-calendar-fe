import 'package:flutter/material.dart';
import 'package:santa_calendar_fe/screens/calendar/calendar_screen.dart';
import 'package:santa_calendar_fe/screens/login/login_screen.dart';
import 'package:santa_calendar_fe/screens/login/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginScreen());
  }
}
