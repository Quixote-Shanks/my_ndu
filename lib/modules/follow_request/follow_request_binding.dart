import 'package:get/get.dart';
import 'package:my_ndu/modules/follow_request/follow_request_controller.dart';

class FollowRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(FollowRequestController.new);
  }
}
