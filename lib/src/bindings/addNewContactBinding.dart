import 'package:get/get.dart';
import '../controllers/addNewContactController.dart';

class AddNewContactBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<AddNewContactController>(() => AddNewContactController());
  }
}