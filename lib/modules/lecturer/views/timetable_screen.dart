import 'package:flutter/material.dart';

class TimetableScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Timetable',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lecture Timetable',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            TimetableCard(
              courseName: 'Mathematics',
              time: 'Mon, Wed, Fri: 10:00 AM - 11:30 AM',
              location: 'Room 101',
            ),
            TimetableCard(
              courseName: 'Physics',
              time: 'Tue, Thu: 2:00 PM - 3:30 PM',
              location: 'Room 202',
            ),
          ],
        ),
      ),
    );
  }
}

class TimetableCard extends StatelessWidget {
  final String courseName;
  final String time;
  final String location;

  TimetableCard({required this.courseName, required this.time, required this.location});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        title: Text(
          courseName,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              time,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[600],
              ),
            ),
            Text(
              location,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        onTap: () {
          // Handle timetable item tap
        },
      ),
    );
  }
}
