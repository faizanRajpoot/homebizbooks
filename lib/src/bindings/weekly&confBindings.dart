import 'package:get/get.dart';
import 'package:hbb/src/controllers/weekly&confController.dart';



class WeeklyConfBindings extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<WeeklyConfController>(() => WeeklyConfController());
  }
}