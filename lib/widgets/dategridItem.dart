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

  BoxDecoration _getDecoration(BuildContext context) {
    switch (date.state) {
      case DateState.locked:
        return BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [date.color.withOpacity(0.55), date.color.withOpacity(0.9)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        );
      case DateState.openable:
        return BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              Colors.blueAccent.withOpacity(0.55),
              Colors.blueAccent.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        );
      case DateState.opened:
        return BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              Colors.amber.withOpacity(0.55),
              Colors.amber.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectDate,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: _getDecoration(context),
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
