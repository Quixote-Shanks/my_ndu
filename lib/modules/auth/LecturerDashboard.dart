import 'package:flutter/material.dart';

class LecturerDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lecturer Dashboard'),
      ),
      drawer: const Drawer(
          // Add your drawer content here
          ),
      body: const Center(
        child: Text(
          'Welcome to the Lecturer Dashboard!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
