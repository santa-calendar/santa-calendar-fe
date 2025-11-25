import 'package:flutter/material.dart';
import 'package:santa_calendar_fe/data/dummy_data.dart';
import 'package:santa_calendar_fe/models/date.dart';
import 'package:santa_calendar_fe/screens/calendar/date_detail_screen.dart';
import 'package:santa_calendar_fe/widgets/dateGridItem.dart';
import 'package:santa_calendar_fe/widgets/editor_action_button.dart';
import 'package:santa_calendar_fe/widgets/main_drawer.dart';

// 달력 화면

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  List<Date> _dates = [];
  final int _today = 15;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initState();
  }

  void _initState() {
    _dates = availableDates.map((originDate) {
      int dayNum = int.parse(originDate.date);
      DateState state;

      if (dayNum > _today) {
        state = DateState.locked;
      } else {
        state = DateState.openable;
      }

      return Date(
        id: originDate.id,
        date: originDate.date,
        state: state,
        color: originDate.color,
      );
    }).toList();
  }

  void _onCardTap(int index) {
    Date tappedDate = _dates[index];

    if (tappedDate.state == DateState.locked) {
      // locked
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("아직 ㄴ"), duration: Duration(seconds: 1)),
      );
    } else if (tappedDate.state == DateState.openable) {
      setState(() {
        _dates[index] = Date(
          id: tappedDate.id,
          date: tappedDate.date,
          state: DateState.opened,
        );
      });

      _selectDate(context, tappedDate);
    } else {
      _selectDate(context, tappedDate);
    }
  }

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
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 40,
          mainAxisSpacing: 50,
        ),
        itemCount: _dates.length,
        itemBuilder: (context, index) {
          return DateGriditem(
            date: _dates[index],
            onSelectDate: () {
              _onCardTap(index);
            },
          );
        },
      ),
    );
  }
}
