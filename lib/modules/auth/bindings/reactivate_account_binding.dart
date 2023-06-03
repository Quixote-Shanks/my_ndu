import 'package:get/get.dart';
import 'package:my_ndu/modules/auth/controllers/reactivate_account_controller.dart';

class ReactivateAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(ReactivateAccountController.new);
  }
}
