import 'package:flutter/material.dart';

class LecturerDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lecturer Dashboard'),
      ),
      drawer: Drawer(
          // Add your drawer content here
          ),
      body: Center(
        child: Text(
          'Welcome to the Lecturer Dashboard!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
