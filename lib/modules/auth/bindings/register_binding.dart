import 'package:get/get.dart';
import 'package:my_ndu/modules/auth/controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(RegisterController.new);
  }
}
