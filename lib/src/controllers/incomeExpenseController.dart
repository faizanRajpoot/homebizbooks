import 'package:get/get.dart';
import 'package:hbb/src/utils/helpers/api_helper.dart';

class IncomeExpenseController extends GetxController {
  var incomeExpenseData;
  RxBool loader = false.obs;
  RxBool isUpdate = false.obs;
  var data;
  var editId;

  @override
  void onInit() {
    getData();

    var a = 'lllj';
    if(a.contains('j')){}
    super.onInit();
  }

  void delete() async {
    print(editId);
    await apiFetcher('Delete', '/api/expense/$editId');
    getData();
  }

  void getData() async {
    loader.value = false;
    var data = await apiFetcher('Get', '/api/expense');
    loader.value = true;
    incomeExpenseData = data['data'];
  }
}
