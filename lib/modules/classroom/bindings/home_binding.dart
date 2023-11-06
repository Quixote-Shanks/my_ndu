
import 'package:get/get.dart';
import 'package:my_ndu/modules/classroom/controllers/home_controller.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClassHomeController>(() => ClassHomeController());
  }
}

