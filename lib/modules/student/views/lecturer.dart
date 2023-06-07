import 'package:flutter/material.dart';

// Define the LecturerSchedulePage widget
class LecturerSchedulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lecturer Schedule'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lecturer Name: John Doe',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Timetable',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            LecturerTimetable(),
            SizedBox(height: 16),
            Text(
              'Schedule',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            LecturerSchedule(),
          ],
        ),
      ),
    );
  }
}

// Define the LecturerTimetable widget
class LecturerTimetable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Table(
        defaultColumnWidth: FixedColumnWidth(100),
        border: TableBorder.all(color: Colors.grey),
        children: [
          TableRow(
            children: [
              TableCell(child: Text('Time')),
              TableCell(child: Text('Monday')),
              TableCell(child: Text('Tuesday')),
              TableCell(child: Text('Wednesday')),
              TableCell(child: Text('Thursday')),
              TableCell(child: Text('Friday')),
            ],
          ),
          TableRow(
            children: [
              TableCell(child: Text('9:00 AM')),
              TableCell(child: Text('Physics 101\nRoom 101')),
              TableCell(child: SizedBox.shrink()),
              TableCell(child: Text('Physics 101\nRoom 101')),
              TableCell(child: SizedBox.shrink()),
              TableCell(child: Text('Physics 101\nRoom 101')),
            ],
          ),
          TableRow(
            children: [
              TableCell(child: Text('10:00 AM')),
              TableCell(child: SizedBox.shrink()),
              TableCell(child: Text('Math 201\nRoom 201')),
              TableCell(child: SizedBox.shrink()),
              TableCell(child: Text('Math 201\nRoom 201')),
              TableCell(child: SizedBox.shrink()),
            ],
          ),
          // Add more rows for different times
        ],
      ),
    );
  }
}

// Define the LecturerSchedule widget
class LecturerSchedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          ListTile(
            title: Text('Monday'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('9:00 AM - 10:30 AM'),
                Text('Physics 101'),
                Text('Room 101'),
              ],
            ),
          ),
          ListTile(
            title: Text('Tuesday'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('10:00 AM - 11:30 AM'),
                Text('Math 201'),
                Text('Room 201'),
              ],
            ),
          ),
          // Add more ListTile widgets for different days and schedule items
        ],
      ),
    );
  }
}
