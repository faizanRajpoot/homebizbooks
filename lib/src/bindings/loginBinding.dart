
import 'package:hbb/src/controllers/loginController.dart';
import 'package:get/get.dart';

class LogInBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<LogInController>(() => LogInController());
  }
}