import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  final String name;
  final String contactDetails;
  final String role;

  UserProfileScreen({required this.name, required this.contactDetails, required this.role});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(name),
            SizedBox(height: 16.0),
            Text(
              'Contact Details:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(contactDetails),
            SizedBox(height: 16.0),
            Text(
              'Role:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(role),
          ],
        ),
      ),
    );
  }
}
