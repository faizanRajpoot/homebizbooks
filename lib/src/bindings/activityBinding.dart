import 'package:hbb/src/controllers/activityController.dart';
import 'package:get/get.dart';

class ActivityBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<ActivityController>(() => ActivityController());
  }
}