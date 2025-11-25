import 'package:flutter/material.dart';
import 'package:santa_calendar_fe/data/dummy_data.dart';
import 'package:santa_calendar_fe/models/date.dart';
import 'package:santa_calendar_fe/screens/calendar/date_detail_screen.dart';
import 'package:santa_calendar_fe/widgets/dateGridItem.dart';
import 'package:santa_calendar_fe/widgets/editor_action_button.dart';
import 'package:santa_calendar_fe/widgets/main_drawer.dart';

// 달력 화면

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  void _selectDate(BuildContext context, Date date) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) => DateDetailScreen(date: date.date)),
    ); // = Navigator.push(context, route)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('P!ick your date')),
      drawer: const MainDrawer(),
      floatingActionButton: EditorActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: GridView.count(
        padding: const EdgeInsets.all(220),
        crossAxisCount: 4,
        crossAxisSpacing: 40,
        mainAxisSpacing: 50,
        children: [
          for (final date in availableDates)
            DateGriditem(
              date: date,
              onSelectDate: () {
                _selectDate(context, date);
              },
            ),
        ],
      ),
    );
  }
}
