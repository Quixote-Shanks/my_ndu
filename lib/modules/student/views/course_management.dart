import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/course_management.dart';

class CourseManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Management'),
      ),
      body: Center(
        child: CourseListScreen(),
      ),
    );
  }
}

class CourseListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CourseManagementController>(
      init: CourseManagementController(),
      builder: (controller) {
        return ListView.builder(
          itemCount: controller.courses.length,
          itemBuilder: (context, index) {
            var course = controller.courses[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Card(
                child: InkWell(
                  onTap: () => Get.toNamed('/course_details', arguments: course),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              course.title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text('Instructor: ${course.instructor}'),
                          ],
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => controller.removeCourse(course.id),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
