import 'package:get/get.dart';
import 'package:hbb/src/controllers/addincomeexpenseController.dart';

class AddIncomeExpenseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddIncomeExpenseController>(() => AddIncomeExpenseController());
  }
}
