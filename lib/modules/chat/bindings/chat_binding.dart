import 'package:get/get.dart';
import 'package:my_ndu/modules/chat/controllers/chat_controller.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(ChatController.new);
  }
}
