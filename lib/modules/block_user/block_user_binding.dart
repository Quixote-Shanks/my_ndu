import 'package:get/get.dart';
import 'package:my_ndu/modules/block_user/block_user_controller.dart';

class BlockUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(BlockUserController.new);
  }
}
