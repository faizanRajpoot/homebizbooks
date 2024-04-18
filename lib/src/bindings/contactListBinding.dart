import 'package:get/get.dart';
import '../controllers/contactlistController.dart';

class ContactListBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<ContactListController>(() => ContactListController());
  }
}