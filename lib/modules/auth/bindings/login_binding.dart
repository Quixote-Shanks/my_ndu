import 'package:get/get.dart';
import 'package:my_ndu/modules/auth/controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(LoginController.new);
  }
}
