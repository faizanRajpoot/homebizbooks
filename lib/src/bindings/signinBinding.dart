
import 'package:hbb/src/controllers/signinController.dart';
import 'package:get/get.dart';

class SignInBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<SignInController>(() => SignInController());
  }
}