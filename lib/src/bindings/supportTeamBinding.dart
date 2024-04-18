import 'package:get/get.dart';
import '../controllers/SupportTeamController.dart';

class SupportTeamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SupportTeamController>(() => SupportTeamController());
  }
}
