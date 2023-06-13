import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ndu/modules/student/views/course_management.dart';
import 'package:my_ndu/modules/student/views/event.dart';
import 'package:my_ndu/modules/student/views/feed.dart';
import 'package:my_ndu/modules/student/views/tntoken.dart';
import '../../classroom/views/ui/views/home_view.dart';
import '../controllers/dashboard_controller.dart';
import 'home_screen.dart';
import 'p2p.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final DashboardController _dashboardController = Get.put(DashboardController());

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
                for (int i = 0; i < _dashboardController.screenTitles.length; i++)
                  ListTile(
                    leading: const Icon(Icons.home, color: Colors.white),
                    title: Text(
                      _dashboardController.screenTitles[i],
                      style: drawerItemText,
                    ),
                    selected: _dashboardController.selectedIndex.value == i,
                    selectedTileColor: Colors.indigo[700],
                    onTap: () {
                      _dashboardController.selectScreen(i);
                      Navigator.pop(context);
                    },
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(_dashboardController.screenTitles[_dashboardController.selectedIndex.value])),
        actions: [],
      ),
      drawer: _buildDrawer(context),
      body: Obx(() => _dashboardController.screens[_dashboardController.selectedIndex.value]),
    );
  }
}


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeView(),
    );
  }
}

class CourseManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CourseListScreen(),
      ),
    );
  }
}

class ClassroomManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeView(),
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
