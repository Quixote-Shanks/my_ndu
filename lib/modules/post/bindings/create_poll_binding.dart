import 'package:get/get.dart';
import 'package:my_ndu/modules/post/controllers/create_poll_controller.dart';

class CreatePollBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(CreatePollController.new);
  }
}
