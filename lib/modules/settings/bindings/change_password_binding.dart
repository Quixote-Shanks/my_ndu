import 'package:get/get.dart';
import 'package:my_ndu/modules/settings/controllers/change_password_controller.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(ChangePasswordController.new);
  }
}
