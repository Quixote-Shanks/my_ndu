import 'package:get/get.dart';
import 'package:my_ndu/modules/profile/controllers/edit_profession_controller.dart';

class EditProfessionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(EditProfessionController.new);
  }
}
