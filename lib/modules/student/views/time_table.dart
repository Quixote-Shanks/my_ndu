import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timetable App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TimetablePage(),
    );
  }
}

class TimetablePage extends StatefulWidget {
  @override
  _TimetablePageState createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<DaySchedule> timetableData = [];

  @override
  void initState() {
    super.initState();
    loadTimetableData();
  }

  Future<void> loadTimetableData() async {
    final jsonStr = await rootBundle.loadString('assets/your_json_file.json');
    final jsonData = json.decode(jsonStr);
    final List<dynamic> daysData = jsonData['days'];
    timetableData = daysData.map((dayData) => DaySchedule.fromJson(dayData)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timetable'),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2022, 1, 1),
            lastDay: DateTime.utc(2023, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              // Use this to set the selected day style.
              return isSameDay(_selectedDay, day);
            },
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: timetableData.length,
              itemBuilder: (context, index) {
                final daySchedule = timetableData[index];
                return ExpansionTile(
                  title: Text(daySchedule.day),
                  children: <Widget>[
                    for (var schedule in daySchedule.schedule)
                      ListTile(
                        leading: Text(schedule.startTime),
                        title: Text(schedule.className),
                        subtitle: Text(schedule.classLocation),
                        trailing: Text(schedule.endTime),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DaySchedule {
  final String day;
  final List<Schedule> schedule;

  DaySchedule({
    required this.day,
    required this.schedule,
  });

  factory DaySchedule.fromJson(Map<String, dynamic> json) {
    final List<dynamic> scheduleJson = json['schedule'];
    final List<Schedule> scheduleList = scheduleJson.map((json) => Schedule.fromJson(json)).toList();
    return DaySchedule(
      day: json['day'],
      schedule: scheduleList,
    );
  }
}

class Schedule {
  final String startTime;
  final String endTime;
  final String className;
  final String classLocation;

  Schedule({
    required this.startTime,
    required this.endTime,
    required this.className,
    required this.classLocation,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      startTime: json['start_time'],
      endTime: json['end_time'],
      className: json['class_name'],
      classLocation: json['class_location'],
    );
  }
}
