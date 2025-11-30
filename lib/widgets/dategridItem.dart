import 'package:flutter/material.dart';
import 'package:santa_calendar_fe/models/date.dart';

class DateGriditem extends StatelessWidget {
  const DateGriditem({
    super.key,
    required this.date,
    required this.onSelectDate,
  });

  final Date date;
  final void Function() onSelectDate;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectDate,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [date.color.withAlpha(55), date.color.withAlpha(90)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          date.date,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
