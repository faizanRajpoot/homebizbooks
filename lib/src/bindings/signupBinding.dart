
import 'package:hbb/src/controllers/signupController.dart';
import 'package:get/get.dart';

class SignUpBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<SignUpController>(() => SignUpController());
  }
}