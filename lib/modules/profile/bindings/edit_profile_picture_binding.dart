import 'package:get/get.dart';
import 'package:my_ndu/modules/profile/controllers/edit_profile_picture_controller.dart';

class EditProfilePictureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(EditProfilePictureController.new);
  }
}
