import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.bodyLarge!.color,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Navigate to settings or customization screen
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 1.2,
                ),
                itemCount: controller.screens.length,
                itemBuilder: (context, index) {
                  final widget = controller.screens[index];
                  final title = controller.screenTitles[index];
                  final iconData = _getIconData(title);
                  return GestureDetector(
                    onTap: () => controller.selectScreen(index),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 8.0,
                            offset: Offset(0, 3),
                          ),
                        ],
                        color: Theme.of(context).cardColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            iconData,
                            size: 60,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          SizedBox(height: 12),
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                _truncateTitle(title, 15),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).textTheme.bodyLarge!.color,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconData(String title) {
    switch (title) {
      case 'Home':
        return FontAwesomeIcons.house;
      case 'Course Management':
        return FontAwesomeIcons.book;
      case 'Event':
        return FontAwesomeIcons.calendar;
      case 'Peer-to-Peer Learning':
        return FontAwesomeIcons.users;
      case 'TNTokens':
        return FontAwesomeIcons.wallet;
      case 'Notifications':
        return FontAwesomeIcons.bell;
      default:
        return FontAwesomeIcons.question;
    }
  }

  String _truncateTitle(String title, int maxLength) {
    if (title.length <= maxLength) {
      return title;
    } else {
      return title.substring(0, maxLength - 3) + '...';
    }
  }
}
