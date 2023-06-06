import 'package:flutter/material.dart';

class StudentDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Dashboard'),
      ),
      drawer: const Drawer(
          // Add your drawer content here
          ),
      body: const Center(
        child: Text(
          'Welcome to the Student Dashboard!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
