import 'package:get/get.dart';
import 'package:hbb/src/controllers/addExpController.dart';



class AddExpBindings extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<AddExpController>(() => AddExpController());
  }
}