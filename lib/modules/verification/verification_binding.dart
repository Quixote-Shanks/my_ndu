import 'package:get/get.dart';
import 'package:my_ndu/modules/verification/verification_controller.dart';

class VerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(VerificationController.new);
  }
}
