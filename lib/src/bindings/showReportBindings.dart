import 'package:get/get.dart';
import 'package:hbb/src/controllers/showReportController.dart';

class ShowReportBingings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowReportController>(() => ShowReportController());
  }
}
