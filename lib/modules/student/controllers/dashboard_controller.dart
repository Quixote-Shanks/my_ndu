import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

import '../../../apis/models/entities/student.dart';
import '../../../apis/providers/api_provider.dart';
import '../../home/views/home_view.dart';
import '../../lecturer/views/notification_screen.dart';
import '../views/course_management.dart';
import '../views/event.dart';
import '../views/feed.dart';
import '../views/p2p.dart';
import '../views/tntoken.dart';

class DashboardController extends GetxController {
  final RxList<Widget> screens = <Widget>[].obs;
  final RxInt selectedIndex = 0.obs;
  final List<String> screenTitles = [
    'Home',
    'Course Management',
    'Event',
    'Peer-to-Peer Learning',
    'TNTokens',
    'Notifications',
  ];
  final String boxName = 'students';

  late Box<Student> studentBox;
  final ApiProvider _apiProvider = ApiProvider(http.Client());

  List<WidgetData> availableWidgets = [
    WidgetData(title: 'Home', widget: const HomeView()),
    WidgetData(title: 'Course Management', widget: CourseManagementScreen()),
    WidgetData(title: 'Event', widget: EventListPage()),
    WidgetData(title: 'Peer-to-Peer Learning', widget: P2PLearningApp()),
    WidgetData(title: 'TNTokens', widget: TaskListPage()),
    WidgetData(title: 'Notifications', widget: NotificationsScreen()),
  ];

  void initializeDefaultLayout() {
    screens.value = [
      const HomeView(),
      CourseManagementScreen(),
      EventListPage(),
      P2PLearningApp(),
      TaskListPage(),
      NotificationsScreen(),
    ];
  }

  void selectScreen(int index) {
    selectedIndex.value = index;
    Get.to(() => screens[index]);
  }

  Future<void> savePersonalizedLayout() async {
    final student = studentBox.get(0);

    if (student != null) {
      final personalizedLayout = screens.map((widget) {
        final index = screens.indexOf(widget);
        return screenTitles[index];
      }).toList();

      student.personalizedDashboard =
          personalizedLayout as Map<String, dynamic>?;
      await _apiProvider.updateStudentDashboard(student);
      await studentBox.put(0, student);
    }
  }

  void rearrangeSections(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final widget = screens.removeAt(oldIndex);
    screens.insert(newIndex, widget);
  }

  void addWidget(Widget widget) {
    screens.add(widget);
  }

  void hideElement(int index) {
    screens.removeAt(index);
    if (selectedIndex.value >= index) {
      selectedIndex.value -= 1;
    }
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    await Hive.initFlutter();
    Hive.registerAdapter(StudentAdapter());
    studentBox = await Hive.openBox<Student>(boxName);
    initializeDefaultLayout();
  }

  @override
  void onClose() {
    studentBox.close();
    super.onClose();
  }
}

class WidgetData {
  final String title;
  final Widget widget;

  WidgetData({required this.title, required this.widget});
}
