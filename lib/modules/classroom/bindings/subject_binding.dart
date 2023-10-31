
import 'package:get/get.dart';
import 'package:my_ndu/modules/classroom/controllers/subject_controller.dart';

class SubjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubjectController>(() => SubjectController());
  }
}

