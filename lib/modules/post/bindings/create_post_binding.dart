import 'package:get/get.dart';
import 'package:my_ndu/modules/post/controllers/create_post_controller.dart';

class CreatePostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(CreatePostController.new);
  }
}
