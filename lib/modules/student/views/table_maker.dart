import 'dart:convert';
import 'package:flutter/material.dart';

class TableMaker {
  List<Widget> allItems = [];

  void initializeData(String jsonTimetable) {
    final timetableData = json.decode(jsonTimetable);
    final List daysData = timetableData['days'];

    for (final dayData in daysData) {
      final day = dayData['day'];
      final schedule = dayData['schedule'];

      _generateClassTimeCards(day);

      for (final classData in schedule) {
        final startTime = classData['start_time'];
        final endTime = classData['end_time'];
        final className = classData['class_name'];
        final classLocation = classData['class_location'];

        _addClassCard(day, startTime, endTime, className, classLocation);
      }
    }
  }

  void _generateClassTimeCards(String day) {
    for (int i = 0; i < 8; i++) {
      allItems.add(
        ClassTime(
          classNum: (i + 1).toString(),
          startTime: _getTimeFromIndex(i),
          endTime: _getTimeFromIndex(i + 1),
        ),
      );

      for (int j = 0; j <= 6; j++) {
        allItems.add(
          ClassCard(),
        );
      }
    }
  }

  void _addClassCard(
      String day, String startTime, String endTime, String className, String classLocation) {
    final dayIndex = _getDayIndex(day);
    final startTimeIndex = _getTimeIndex(startTime);
    final endTimeIndex = _getTimeIndex(endTime);

    for (int i = startTimeIndex; i <= endTimeIndex; i++) {
      final classTimeIndex = 8 * i + dayIndex;
      allItems[classTimeIndex] = ClassCard(
        className: className,
        classLocation: classLocation,
      );
    }
  }

  int _getDayIndex(String day) {
    switch (day) {
      case 'Monday':
        return 0;
      case 'Tuesday':
        return 1;
      case 'Wednesday':
        return 2;
      case 'Thursday':
        return 3;
      case 'Friday':
        return 4;
      default:
        return 0;
    }
  }

  int _getTimeIndex(String time) {
    final parts = time.split(' ')[0].split(':');
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);

    return (hour - 8) * 2 + (minute == 30 ? 1 : 0);
  }

  String _getTimeFromIndex(int index) {
    final hour = index ~/ 2 + 8;
    final minute = index % 2 == 0 ? '00' : '30';

    return '$hour:$minute';
  }
}

class ClassTime extends StatelessWidget {
  final String classNum;
  final String startTime;
  final String endTime;

  const ClassTime({
    required this.classNum,
    required this.startTime,
    required this.endTime,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Replace with your desired ClassTime widget implementation
      child: Text('$classNum: $startTime - $endTime'),
    );
  }
}

class ClassCard extends StatelessWidget {
  final String className;
  final String classLocation;

  const ClassCard({
    this.className = '',
    this.classLocation = '',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Replace with your desired ClassCard widget implementation
      child: Column(
        children: [
          Text(className),
          Text(classLocation),
        ],
      ),
    );
  }
}
