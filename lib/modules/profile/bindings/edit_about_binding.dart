import 'package:get/get.dart';
import 'package:my_ndu/modules/profile/controllers/edit_about_controller.dart';

class EditAboutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(EditAboutController.new);
  }
}
