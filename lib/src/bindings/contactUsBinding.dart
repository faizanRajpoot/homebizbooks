import 'package:get/get.dart';
import 'package:hbb/src/controllers/contactUsController.dart';

class ContactUsBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<ContactUsController>(() => ContactUsController());
  }
}