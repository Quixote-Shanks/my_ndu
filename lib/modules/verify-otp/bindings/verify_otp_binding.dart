import 'package:get/get.dart';
import 'package:my_ndu/modules/verify-otp/controllers/verify_otp_controller.dart';

class VerifyOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(VerifyOtpController.new);
  }
}
