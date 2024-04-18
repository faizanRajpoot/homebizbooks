
import 'package:get/get.dart';
import 'package:hbb/src/controllers/incomeExpenceRepController.dart';

class IncomeExpenceRepBindings extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<IncomeExpenceRepController>(() => IncomeExpenceRepController());
  }
}