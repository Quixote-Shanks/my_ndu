import 'package:get/get.dart';
import 'package:my_ndu/modules/settings/controllers/login_info_controller.dart';

class LoginInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(LoginInfoController.new);
  }
}
