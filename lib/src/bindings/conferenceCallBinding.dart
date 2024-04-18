import 'package:get/get.dart';
import '../controllers/conferenceCallController.dart';

class ConferenceCallBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConferenceCallController>(() => ConferenceCallController());
  }
}
