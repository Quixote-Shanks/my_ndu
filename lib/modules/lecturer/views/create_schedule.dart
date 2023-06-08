import 'package:flutter/material.dart';

class CreateScheduleScreen extends StatefulWidget {
  @override
  _CreateScheduleScreenState createState() => _CreateScheduleScreenState();
}

class _CreateScheduleScreenState extends State<CreateScheduleScreen> {
  String selectedParticipant = 'Participant 1'; // Initialize with the first participant
  String selectedTimeSlot = '9:00 AM';
  TextEditingController detailsController = TextEditingController();

  List<String> participants = ['Participant 1', 'Participant 2', 'Participant 3'];
  List<String> timeSlots = ['9:00 AM', '11:00 AM', '2:00 PM', '4:00 PM'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Schedule'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Participants:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            DropdownButtonFormField<String>(
              value: selectedParticipant,
              onChanged: (newValue) {
                setState(() {
                  selectedParticipant = newValue!;
                });
              },
              items: participants.map((participant) {
                return DropdownMenuItem<String>(
                  value: participant,
                  child: Text(participant),
                );
              }).toList(),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Time Slot:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            DropdownButtonFormField<String>(
              value: selectedTimeSlot,
              onChanged: (newValue) {
                setState(() {
                  selectedTimeSlot = newValue!;
                });
              },
              items: timeSlots.map((timeSlot) {
                return DropdownMenuItem<String>(
                  value: timeSlot,
                  child: Text(timeSlot),
                );
              }).toList(),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Details:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: detailsController,
              maxLines: 4,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Code to save the schedule and perform necessary actions
                // e.g., send schedule request, update calendar, etc.
                String participant = selectedParticipant;
                String timeSlot = selectedTimeSlot;
                String details = detailsController.text;
                // Perform actions with the schedule data
              },
              child: Text('Create Schedule'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    detailsController.dispose();
    super.dispose();
  }
}
