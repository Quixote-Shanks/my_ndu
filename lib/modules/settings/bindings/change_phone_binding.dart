import 'package:get/get.dart';
import 'package:my_ndu/modules/settings/controllers/change_phone_controller.dart';

class ChangePhoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(ChangePhoneController.new);
  }
}
