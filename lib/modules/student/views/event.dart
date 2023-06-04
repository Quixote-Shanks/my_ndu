import 'package:flutter/material.dart';

class EventListPage extends StatelessWidget {
  final List<Event> events = [
    Event(
      title: 'Workshop: Mobile App Development',
      date: DateTime(2023, 6, 10),
      time: TimeOfDay(hour: 14, minute: 30),
      location: 'Room 101',
      description: 'Learn how to develop mobile apps using Flutter.',
    ),
    Event(
      title: 'Seminar: Artificial Intelligence',
      date: DateTime(2023, 6, 15),
      time: TimeOfDay(hour: 10, minute: 0),
      location: 'Auditorium',
      description: 'Explore the latest advancements in AI technology.',
    ),
    Event(
      title: 'Extracurricular Activity: Music Club',
      date: DateTime(2023, 6, 20),
      time: TimeOfDay(hour: 16, minute: 0),
      location: 'Music Room',
      description: 'Join the music club and showcase your talents.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          return EventTile(event: events[index]);
        },
      ),
    );
  }
}

class EventTile extends StatelessWidget {
  final Event event;

  EventTile({required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        title: Text(
          event.title,
          style: TextStyle(fontSize: 18),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 16),
                SizedBox(width: 4),
                Text(
                  'Date: ${event.date.day}/${event.date.month}/${event.date.year}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.access_time, size: 16),
                SizedBox(width: 4),
                Text(
                  'Time: ${event.time.format(context)}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.location_on, size: 16),
                SizedBox(width: 4),
                Text(
                  'Location: ${event.location}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 4),
            Text(
              'Description: ${event.description}',
            ),
          ],
        ),
        trailing: ElevatedButton(
          onPressed: () {
            // TODO: Implement RSVP functionality and notifications
          },
          child: Text('RSVP'),
        ),
      ),
    );
  }
}

class Event {
  final String title;
  final DateTime date;
  final TimeOfDay time;
  final String location;
  final String description;

  Event({
    required this.title,
    required this.date,
    required this.time,
    required this.location,
    required this.description,
  });
}
