import 'package:get/get.dart';
import 'package:my_ndu/modules/auth/controllers/student_reg_controller.dart';

class StudentRegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(StudentRegistrationController.new);
  }
}
