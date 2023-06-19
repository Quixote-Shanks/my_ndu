import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';

class DashboardScreen extends StatelessWidget {
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
      body: Obx(() {
        final selectedScreen = _dashboardController.screens[_dashboardController.selectedIndex.value];
        // ignore: unnecessary_type_check
        return selectedScreen is Widget ? selectedScreen : Container();
      }),
    );
  }
}
