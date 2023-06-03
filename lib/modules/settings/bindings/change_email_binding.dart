import 'package:get/get.dart';
import 'package:my_ndu/modules/settings/controllers/change_email_controller.dart';

class ChangeEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(ChangeEmailController.new);
  }
}
