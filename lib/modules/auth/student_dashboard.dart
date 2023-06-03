import 'package:flutter/material.dart';

class StudentDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Dashboard'),
      ),
      drawer: Drawer(
          // Add your drawer content here
          ),
      body: Center(
        child: Text(
          'Welcome to the Student Dashboard!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
