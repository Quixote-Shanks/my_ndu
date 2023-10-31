
import 'package:get/get.dart';
import 'package:my_ndu/modules/classroom/controllers/calendar_controller.dart';

class CalendarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CalendarController>(() => CalendarController());
  }
}

