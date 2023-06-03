import 'package:get/get.dart';
import 'package:my_ndu/modules/chat/controllers/p2p_chat_controller.dart';

class SingleChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(P2PChatController.new);
  }
}
