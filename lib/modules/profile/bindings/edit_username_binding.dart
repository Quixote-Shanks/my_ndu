import 'package:get/get.dart';
import 'package:my_ndu/modules/profile/controllers/edit_username_controller.dart';

class EditUsernameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(EditUsernameController.new);
  }
}
