import 'package:get/get.dart';
import 'package:my_ndu/modules/post/controllers/comment_controller.dart';
import 'package:my_ndu/modules/post/controllers/create_comment_controller.dart';
import 'package:my_ndu/modules/post/controllers/post_details_controller.dart';

class PostDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(PostDetailsController.new);
    Get.lazyPut(CommentController.new);
    Get.lazyPut(CreateCommentController.new);
  }
}
