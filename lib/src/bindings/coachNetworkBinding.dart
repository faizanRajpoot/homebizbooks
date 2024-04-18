import 'package:get/get.dart';
import 'package:hbb/src/controllers/coachNetworkController.dart';

class CoachNetworkBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<CoachNetworkController>(() => CoachNetworkController());
  }
}