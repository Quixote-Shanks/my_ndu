import 'package:get/get.dart';

class CourseManagementController extends GetxController {
  List<Course> courses = [
    Course(id: 1, title: 'Mathematics', instructor: 'John Doe'),
    Course(id: 2, title: 'Physics', instructor: 'Jane Smith'),
    Course(id: 3, title: 'Chemistry', instructor: 'Michael Johnson'),
  ];
}

class Course {
  final int id;
  final String title;
  final String instructor;

  Course({
    required this.id,
    required this.title,
    required this.instructor,
  });
}

