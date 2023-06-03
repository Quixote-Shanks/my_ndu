import 'package:get/get.dart';
import 'package:my_ndu/modules/follower/controllers/followers_list_controller.dart';

class FollowersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(FollowersListController.new);
  }
}
