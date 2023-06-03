import 'package:get/get.dart';
import 'package:my_ndu/modules/profile/controllers/edit_dob_controller.dart';

class EditDOBBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(EditDOBController.new);
  }
}
