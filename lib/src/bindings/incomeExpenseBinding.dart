import 'package:get/get.dart';
import 'package:hbb/src/controllers/incomeExpenseController.dart';

class IncomeExpenseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IncomeExpenseController>(() => IncomeExpenseController());
  }
}
