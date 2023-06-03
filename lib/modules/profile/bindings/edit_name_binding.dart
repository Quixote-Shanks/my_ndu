import 'package:get/get.dart';
import 'package:my_ndu/modules/profile/controllers/edit_name_controller.dart';

class EditNameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(EditNameController.new);
  }
}
