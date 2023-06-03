import 'package:get/get.dart';
import 'package:my_ndu/modules/report/report_controller.dart';

class ReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(ReportController.new);
  }
}
