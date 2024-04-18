import 'package:get/get.dart';
import 'package:hbb/src/controllers/profileController.dart';

class ProfileBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}