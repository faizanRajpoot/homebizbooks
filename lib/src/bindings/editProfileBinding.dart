import 'package:get/get.dart';
import 'package:hbb/src/controllers/editProfileController.dart';

class EditProfileBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<EditProfileController>(() => EditProfileController());
  }
}