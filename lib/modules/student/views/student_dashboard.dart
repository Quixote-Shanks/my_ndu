import 'dart:ui';

import 'package:flutter/material.dart';

import '../../classroom/views/ui/views/home_view.dart';
import 'class.dart';
import 'feed.dart';
import 'home_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    Home(),
    CourseManagementScreen(),
    ClassroomManagementScreen(),
    PeerToPeerLearningScreen(),
    TasksAndTokenizationScreen(),
    EventsAndActivitiesScreen(),
    FeedScreen(),
    CornerScreen(),
    NotificationsScreen(),
    AnalyticsScreen(),
    IntegrationScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/field_or_flower_image.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.0),
                ),
              ),
            ),
          ),
          ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Text(
                  'Student Dashboard',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home, color: Colors.white),
                title: Text(
                  'Home',
                  style: TextStyle(color: Colors.white),
                ),
                selected: _selectedIndex == 0,
                onTap: () {
                  _onItemTapped(0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.school, color: Colors.white),
                title: Text(
                  'Course Management',
                  style: TextStyle(color: Colors.white),
                ),
                selected: _selectedIndex == 1,
                onTap: () {
                  _onItemTapped(1);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.class_, color: Colors.white),
                title: Text(
                  'Classroom Management',
                  style: TextStyle(color: Colors.white),
                ),
                selected: _selectedIndex == 2,
                onTap: () {
                  _onItemTapped(2);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.people, color: Colors.white),
                title: Text(
                  'Peer-to-Peer Learning',
                  style: TextStyle(color: Colors.white),
                ),
                selected: _selectedIndex == 3,
                onTap: () {
                  _onItemTapped(3);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.assignment, color: Colors.white),
                title: Text(
                  'Tasks and Tokenization',
                  style: TextStyle(color: Colors.white),
                ),
                selected: _selectedIndex == 4,
                onTap: () {
                  _onItemTapped(4);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.event, color: Colors.white),
                title: Text(
                  'Events and Activities',
                  style: TextStyle(color: Colors.white),
                ),
                selected: _selectedIndex == 5,
                onTap: () {
                  _onItemTapped(5);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.forum, color: Colors.white),
                title: Text(
                  'Feed',
                  style: TextStyle(color: Colors.white),
                ),
                selected: _selectedIndex == 6,
                onTap: () {
                  _onItemTapped(6);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.chair, color: Colors.white),
                title: Text(
                  'Corner',
                  style: TextStyle(color: Colors.white),
                ),
                selected: _selectedIndex == 7,
                onTap: () {
                  _onItemTapped(7);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.notifications, color: Colors.white),
                title: Text(
                  'Notifications',
                  style: TextStyle(color: Colors.white),
                ),
                selected: _selectedIndex == 8,
                onTap: () {
                  _onItemTapped(8);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.analytics, color: Colors.white),
                title: Text(
                  'Analytics',
                  style: TextStyle(color: Colors.white),
                ),
                selected: _selectedIndex == 9,
                onTap: () {
                  _onItemTapped(9);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading:
                    Icon(Icons.integration_instructions, color: Colors.white),
                title: Text(
                  'Integration',
                  style: TextStyle(color: Colors.white),
                ),
                selected: _selectedIndex == 10,
                onTap: () {
                  _onItemTapped(10);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.person, color: Colors.white),
                title: Text(
                  'Profile',
                  style: TextStyle(color: Colors.white),
                ),
                selected: _selectedIndex == 11,
                onTap: () {
                  _onItemTapped(11);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Implement logout functionality here
              // For example, navigate to the login screen and clear the user session
            },
          ),
        ],
      ),
      drawer: _buildDrawer(context),
      body: _screens[_selectedIndex],
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(),
    );
  }
}

class CourseManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Course Management'),
      ),
      body: Center(
        child: Text('Course Management Screen'),
      ),
    );
  }
}

class ClassroomManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Classroom Management'),
      ),
      // body: VirtualClassroom(),
      body: const HomeView(),
    );
  }
}

class PeerToPeerLearningScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peer-to-Peer Learning'),
      ),
      body: Center(
        child: Text('Peer-to-Peer Learning Screen'),
      ),
    );
  }
}

class TasksAndTokenizationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks and Tokenization'),
      ),
      body: Center(
        child: Text('Tasks and Tokenization Screen'),
      ),
    );
  }
}

class EventsAndActivitiesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events and Activities'),
      ),
      body: Center(
        child: Text('Events and Activities Screen'),
      ),
    );
  }
}

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PostTopic(),
    );
  }
}

class CornerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Corner'),
      ),
      body: Center(
        child: Text('Corner Screen'),
      ),
    );
  }
}

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Center(
        child: Text('Notifications Screen'),
      ),
    );
  }
}

class AnalyticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Analytics'),
      ),
      body: Center(
        child: Text('Analytics Screen'),
      ),
    );
  }
}

class IntegrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Integration'),
      ),
      body: Center(
        child: Text('Integration Screen'),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Text('Profile Screen'),
      ),
    );
  }
}
