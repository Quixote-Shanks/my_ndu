import 'package:flutter/material.dart';

class ScheduleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Schedule',
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
              'Upcoming Schedule',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            ScheduleCard(
              eventName: 'Meeting with Students',
              date: 'June 10, 2023',
              time: '2:00 PM - 3:00 PM',
              location: 'Room 303',
            ),
            ScheduleCard(
              eventName: 'Seminar Presentation',
              date: 'June 12, 2023',
              time: '10:00 AM - 12:00 PM',
              location: 'Auditorium',
            ),
          ],
        ),
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  final String eventName;
  final String date;
  final String time;
  final String location;

  ScheduleCard({required this.eventName, required this.date, required this.time, required this.location});

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
          eventName,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              date,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[600],
              ),
            ),
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
          // Handle schedule item tap
        },
      ),
    );
  }
}
