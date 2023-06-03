import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_ndu/modules/student/views/course_management.dart';

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
  const drawerHeaderText = TextStyle(
    color: Colors.white,
    fontSize: 24.0,
  );

  const drawerItemText = TextStyle(
    color: Colors.white,
  );

  return Drawer(
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Colors.blueGrey[900]!,
            Colors.indigo[900]!,
          ].whereType<Color>().toList(),
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/unsplash1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                  ),
                ),
              ),
            ),
          ),
          ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Text(
                  'Student Dashboard',
                  style: drawerHeaderText,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home, color: Colors.white),
                title: const Text(
                  'Home',
                  style: drawerItemText,
                ),
                selected: _selectedIndex == 0,
                selectedTileColor: Colors.indigo[700],
                onTap: () {
                  _onItemTapped(0);
                  Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.school, color: Colors.white),
              title: const Text(
                'Course Management',
                style: drawerItemText,
              ),
              selected: _selectedIndex == 1,
              selectedTileColor: Colors.indigo[700],
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.class_, color: Colors.white),
              title: const Text(
                'Classroom Management',
                style: drawerItemText,
              ),
              selected: _selectedIndex == 2,
              selectedTileColor: Colors.indigo[700],
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.people, color: Colors.white),
              title: const Text(
                'Peer-to-Peer Learning',
                style: drawerItemText,
              ),
              selected: _selectedIndex == 3,
              selectedTileColor: Colors.indigo[700],
              onTap: () {
                _onItemTapped(3);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.assignment, color: Colors.white),
              title: const Text(
                'Tasks and Tokenization',
                style: drawerItemText,
              ),
              selected: _selectedIndex == 4,
              selectedTileColor: Colors.indigo[700],
              onTap: () {
                _onItemTapped(4);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.event, color: Colors.white),
              title: const Text(
                'Events and Activities',
                style: drawerItemText,
              ),
              selected: _selectedIndex == 5,
              selectedTileColor: Colors.indigo[700],
              onTap: () {
                _onItemTapped(5);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.forum, color: Colors.white),
              title: const Text(
                'Feed',
                style: drawerItemText,
              ),
              selected: _selectedIndex == 6,
              selectedTileColor: Colors.indigo[700],
              onTap: () {
                _onItemTapped(6);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.chair, color: Colors.white),
              title: const Text(
                'Corner',
                style: drawerItemText,
              ),
              selected: _selectedIndex == 7,
              selectedTileColor: Colors.indigo[700],
              onTap: () {
                _onItemTapped(7);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications, color: Colors.white),
              title: const Text(
                'Notifications',
                style: drawerItemText,
              ),
              selected: _selectedIndex == 8,
              selectedTileColor: Colors.indigo[700],
              onTap: () {
                _onItemTapped(8);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.analytics, color: Colors.white),
              title: const Text(
                'Analytics',
                style: drawerItemText,
              ),
              selected: _selectedIndex == 9,
              selectedTileColor: Colors.indigo[700],
              onTap: () {
                _onItemTapped(9);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.integration_instructions, color: Colors.white),
              title: const Text(
                'Integration',
                style: drawerItemText,
              ),
              selected: _selectedIndex == 10,
              selectedTileColor: Colors.indigo[700],
              onTap: () {
                _onItemTapped(10);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.white),
              title: const Text(
                'Profile',
                style: drawerItemText,
              ),
              selected: _selectedIndex == 11,
              selectedTileColor: Colors.indigo[700],
              onTap: () {
                _onItemTapped(11);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ],
    ),
  ),);
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
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
      body:  Center(
        child: CourseListScreen(),
      ),
    );
  }
}

class ClassroomManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
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
        title: const Text('Peer-to-Peer Learning'),
      ),
      body: const Center(
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
        title: const Text('Tasks and Tokenization'),
      ),
      body: const Center(
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
        title: const Text('Events and Activities'),
      ),
      body: const Center(
        child: Text('Events and Activities Screen'),
      ),
    );
  }
}

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PostTopic(),
    );
  }
}

class CornerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Corner'),
      ),
      body: const Center(
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
        title: const Text('Notifications'),
      ),
      body: const Center(
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
        title: const Text('Analytics'),
      ),
      body: const Center(
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
        title: const Text('Integration'),
      ),
      body: const Center(
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
        title: const Text('Profile'),
      ),
      body: const Center(
        child: Text('Profile Screen'),
      ),
    );
  }
}
