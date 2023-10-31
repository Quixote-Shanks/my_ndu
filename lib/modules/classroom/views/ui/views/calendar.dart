import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ndu/modules/classroom/controllers/calendar_controller.dart';
import 'package:table_calendar/table_calendar.dart';

class ClassroomCalendarScreen extends StatefulWidget {
  @override
  _ClassroomCalendarScreenState createState() => _ClassroomCalendarScreenState();
}

class _ClassroomCalendarScreenState extends State<ClassroomCalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDate = DateTime.now();
  DateTime _focusedDate = DateTime.now();
  
  // Assuming CalendarController is defined elsewhere in the code and has an 'events' property
  final _calendarController = Get.put(CalendarController());

  final Map<DateTime, List> _events = {
    DateTime(2023, 6, 1): ['Event 1', 'Event 2'],
    DateTime(2023, 6, 5): ['Event 3'],
    DateTime(2023, 6, 8): ['Event 4', 'Event 5', 'Event 6'],
  };
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Classroom Calendar'),
      ),
      body: Column(
        children: [
          TableCalendar(
            calendarFormat: _calendarFormat,
            focusedDay: _focusedDate,
            firstDay: DateTime.utc(2023, 1, 1),
            lastDay: DateTime.utc(2023, 12, 31),
            eventLoader: _getEventsForDay,
            calendarStyle: const CalendarStyle(
              todayTextStyle: TextStyle(fontWeight: FontWeight.bold),
              selectedTextStyle: TextStyle(color: Colors.white),
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            onPageChanged: (focusedDate) {
              setState(() {
                _focusedDate = focusedDate;
              });
            },
          ),
          const SizedBox(height: 16.0),
          Expanded(
            child: ListView(
              children: _getEventsForDay(_selectedDate)
                  .map((event) => ListTile(
                        title: Text(event),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  List<dynamic> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }
}
