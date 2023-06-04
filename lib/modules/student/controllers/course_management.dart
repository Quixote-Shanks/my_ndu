import 'package:get/get.dart';

class CourseManagementController extends GetxController {
  List<Course> courses = [
    Course(id: 1, title: 'Mathematics', department: 'Math', instructor: 'John Doe'),
    Course(id: 2, title: 'Physics', department: 'Physics', instructor: 'Jane Smith'),
    Course(id: 3, title: 'Chemistry', department: 'Chemistry', instructor: 'Michael Johnson'),
  ];

  // Add methods for course management

  void addCourse(Course course) {
    courses.add(course);
    update(); // Refreshes the UI
  }

  void removeCourse(int courseId) {
    courses.removeWhere((course) => course.id == courseId);
    update();
  }

  Course getCourseById(int courseId) {
    return courses.firstWhere((course) => course.id == courseId);
  }

  void updateCourse(Course updatedCourse) {
    final index = courses.indexWhere((course) => course.id == updatedCourse.id);
    if (index != -1) {
      courses[index] = updatedCourse;
      update();
    }
  }

  List<Course> searchCoursesByDepartment(String department) {
    return courses.where((course) => course.department.toLowerCase() == department.toLowerCase()).toList();
  }

  List<Course> searchCoursesByInstructor(String instructor) {
    return courses.where((course) => course.instructor.toLowerCase() == instructor.toLowerCase()).toList();
  }

  Course searchCourseByTitle(String title) {
    return courses.firstWhere((course) => course.title.toLowerCase() == title.toLowerCase(), orElse: () => Course(id: -1, title: '', department: '', instructor: ''));
  }
}

class Course {
  final int id;
  final String title;
  final String department;
  final String instructor;

  Course({
    required this.id,
    required this.title,
    required this.department,
    required this.instructor,
  });
}
