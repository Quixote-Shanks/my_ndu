import 'package:get/get.dart';
import 'package:my_ndu/modules/settings/controllers/send_suggestions_controller.dart';

class SendSuggestionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(SendSuggestionsController.new);
  }
}
