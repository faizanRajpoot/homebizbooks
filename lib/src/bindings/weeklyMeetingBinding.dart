import 'package:get/get.dart';
import '../controllers/weeklyMeetingController.dart';

class WeeklyMeetingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WeeklyMeetingController>(() => WeeklyMeetingController());
  }
}
