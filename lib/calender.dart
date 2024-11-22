import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';  // Import TableCalendar

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => Calendar();
}

class Calendar extends State<CalendarScreen> {
  DateTime today = DateTime.now();  // Today’s date
  DateTime focusedDay = DateTime.now();  // Focused day for TableCalendar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calendar")),
      body: content(),
    );
  }

  Widget content() {
    return Column(
      children: [
        Text("Today's Date: ${today.toLocal()}"),  // Display today's date
        Container(
          padding: EdgeInsets.all(8),  // Padding for the calendar
          child: TableCalendar(
            focusedDay: focusedDay,
            selectedDayPredicate: (day) => isSameDay(today, day),  // Highlight today's date
            firstDay: DateTime.utc(2010, 1, 16),
            lastDay: DateTime.utc(2030, 1, 16),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                today = selectedDay;  // Update today's date when a day is selected
                this.focusedDay = focusedDay;  // Update the focused day
              });
            },
          ),
        ),
      ],
    );
  }
}
