import 'package:get/get.dart';

import '../controllers/addDailyExpController.dart';

class AddDailyExpBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<AddDailyExpController>(() => AddDailyExpController());
  }
}