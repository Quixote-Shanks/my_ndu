import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:my_ndu/apis/providers/api_provider.dart';

import '../../../apis/models/entities/student.dart';
import '../../home/views/home_view.dart';
import '../../lecturer/views/notification_screen.dart';
import '../views/course_management.dart';
import '../views/event.dart';
import '../views/feed.dart';
import '../views/p2p.dart';
import '../views/tntoken.dart';

class DashboardController extends GetxController {
  RxList<Widget> screens = <Widget>[].obs;
  RxInt selectedIndex = 0.obs;
  final List<String> screenTitles = [
    'Home',
    'Course Management',
    'Classroom Management',
    'Peer-to-Peer Learning',
    'Tasks and Tokenization',
    'Events and Activities',
    'Feed',
    'Corner',
    'Notifications',
    'Analytics',
    'Integration',
    'Profile',
  ];
  final String boxName = 'students';

  late Box<Student> studentBox;
  final _apiProvider = ApiProvider(http.Client());

  List<WidgetData> availableWidgets = [
    WidgetData(title: 'Home', widget: const HomeView()),
    WidgetData(title: 'Course Management', widget: CourseManagementScreen()),
    WidgetData(title: 'Course List', widget: CourseListScreen()),
    WidgetData(title: 'Peer-to-Peer Learning', widget: P2PLearningApp()),
    WidgetData(title: 'Task List', widget: TaskListPage()),
    WidgetData(title: 'Event List', widget: EventListPage()),
    WidgetData(title: 'Post Topic', widget: const PostTopic()),
    WidgetData(title: 'Notifications', widget: NotificationsScreen()),
  ];

  void initializeDefaultLayout() {
    // Initialize the default dashboard layout
    screens.value = [
      const HomeView(),
      CourseManagementScreen(),
      CourseListScreen(),
      P2PLearningApp(),
      TaskListPage(),
      EventListPage(),
      const PostTopic(),
      NotificationsScreen(),
    ];
  }

  void selectScreen(int index) {
    selectedIndex.value = index;
  }

  Future<void> savePersonalizedLayout() async {
    // Get the current student
    final student = studentBox.get(0);

    if (student != null) {
      // Update the personalized dashboard layout
      final personalizedLayout = screens.map((widget) {
        final index = screens.indexOf(widget);
        return screenTitles[index];
      }).toList();
      student.personalizedDashboard = personalizedLayout as Map<String, dynamic>?;

      // Call the API to update the student's personalized dashboard layout
      await _apiProvider.updateStudentDashboard(student);

      // Save the updated student object to the box
      await studentBox.put(0, student);
    }
  }

  void rearrangeSections(int oldIndex, int newIndex) {
    screens.insert(newIndex, screens.removeAt(oldIndex));
  }

  void addWidget(Widget widget) {
    screens.add(widget);
  }

  void hideElement(int index) {
    screens.removeAt(index);
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
