import 'package:get/get.dart';
import 'package:hbb/src/controllers/programDetailController.dart';

class ProgramDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProgramDetailController>(() => ProgramDetailController());
  }
}
