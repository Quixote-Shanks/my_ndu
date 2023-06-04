import 'package:get/get.dart';
import '../controllers/course_management.dart';


class CourseManagementBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<CourseManagementController>(CourseManagementController());

  }
}