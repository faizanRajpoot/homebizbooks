import 'package:get/get.dart';
import 'package:hbb/src/controllers/programDataController.dart';

class ProgramDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProgramDataController>(() => ProgramDataController());
  }
}
