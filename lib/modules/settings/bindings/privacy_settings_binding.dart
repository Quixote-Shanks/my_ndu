import 'package:get/get.dart';
import 'package:my_ndu/modules/settings/controllers/account_privacy_controller.dart';

class PrivacySettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(AccountPrivacyController.new);
  }
}
