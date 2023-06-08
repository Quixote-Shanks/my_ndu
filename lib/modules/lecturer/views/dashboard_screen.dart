import 'package:flutter/material.dart';
import 'package:my_ndu/modules/lecturer/views/schedule_screen.dart';
import 'package:my_ndu/modules/lecturer/views/timetable_screen.dart';

import 'package:my_ndu/modules/lecturer/views/notification_screen.dart';

import 'create_schedule.dart';
import 'profile_screen.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome, Dr. John Doe!',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Seniour Lecturer',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 24.0),
            Text(
              'Actions',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                children: [
                  DashboardButton(
                    title: 'View Schedule',
                    icon: Icons.calendar_today,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ScheduleScreen()),
                      );
                    },
                  ),
                  DashboardButton(
                    title: 'Create Schedule',
                    icon: Icons.add,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreateScheduleScreen()),
                      );
                    },
                  ),
                  DashboardButton(
                    title: 'Timetable',
                    icon: Icons.table_chart,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TimetableScreen()),
                      );
                    },
                  ),
                  DashboardButton(
                    title: 'Notifications',
                    icon: Icons.notifications,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NotificationsScreen()),
                      );
                    },
                  ),
                  DashboardButton(
                    title: 'User Profile',
                    icon: Icons.person,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserProfileScreen(
                            name: 'Dr. John Doe',
                            contactDetails: 'johndoe@example.com',
                            role: 'Lecturer, Staff, Admin',
                          ),
                        ),
                      );
                    },
                  ),
                  DashboardButton(
                    title: 'Courses',
                    icon: Icons.book,
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => CourseScreen()),
                      // );
                    },
                  ),
                  DashboardButton(
                    title: 'Faculty',
                    icon: Icons.people,
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => FacultyScreen()),
                      // );
                    },
                  ),
                  // Add more DashboardButton widgets for other actions
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  DashboardButton({required this.title, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 48.0,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(height: 8.0),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
