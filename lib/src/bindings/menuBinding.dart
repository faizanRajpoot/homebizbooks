import 'package:get/get.dart';
import 'package:hbb/src/controllers/menuController.dart';

class MenuBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<MenuController>(() => MenuController());
  }
}