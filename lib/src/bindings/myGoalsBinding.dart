import 'package:get/get.dart';
import 'package:hbb/src/controllers/myGoalsController.dart';

class MyGoalsBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<MyGoalsController>(() => MyGoalsController());
  }
}