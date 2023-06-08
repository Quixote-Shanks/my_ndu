import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
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
              'Latest Notifications',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            NotificationCard(
              title: 'Faculty Meeting',
              description: 'There will be a faculty meeting on June 15, 2023, at 2:00 PM in the conference room.',
              date: 'June 10, 2023',
            ),
            NotificationCard(
              title: 'Course Update',
              description: 'The course schedule for the upcoming semester has been updated. Please check your email for details.',
              date: 'June 9, 2023',
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String description;
  final String date;

  NotificationCard({required this.title, required this.description, required this.date});

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
          title,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              description,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              date,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        onTap: () {
          // Handle notification item tap
        },
      ),
    );
  }
}
