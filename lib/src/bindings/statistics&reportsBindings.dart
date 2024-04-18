import 'package:get/get.dart';
import 'package:hbb/src/controllers/statistics&reportsController.dart';

class StatisticsAndReportsBindings extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<StatisticsAndReportsController>(() => StatisticsAndReportsController());
  }
}