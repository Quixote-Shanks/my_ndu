import 'package:get/get.dart';
import 'package:my_ndu/modules/user/user_details_controller.dart';

class UserProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(UserDetailsController.new);
  }
}
