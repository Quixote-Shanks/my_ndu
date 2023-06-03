import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/course_management.dart';

class CourseManagementScreen extends StatelessWidget {
  final CourseManagementController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Course Management'),
      ),
      body: Center(
        child: CourseListScreen(),
      ),
    );
  }
}

class CourseListScreen extends StatelessWidget {
  final CourseManagementController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _controller.courses.length,
      itemBuilder: (context, index) {
        Course course = _controller.courses[index];
        return ListTile(
          title: Text(course.title),
          subtitle: Text(course.instructor),
        );
      },
    );
  }
}

class CourseDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final course = Get.arguments as Course;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Course: ${course.title}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text('Instructor: ${course.instructor}'),
          ],
        ),
      ),
    );
  }
}