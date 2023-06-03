import 'package:get/get.dart';
import 'package:my_ndu/modules/auth/controllers/password_controller.dart';

class PasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(PasswordController.new);
  }
}
