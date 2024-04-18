import 'package:get/get.dart';
import '../utils/helpers/api_helper.dart';

class ContactListController extends GetxController {
  RxBool loader = false.obs;
  RxBool isEdit = false.obs;
  var updateId;

  var data;
  @override
  void onInit() async {
    // var contactDetails = await apiFetcher('Get', '/api/contact');
    // data = (contactDetails['data']);
    // loader.value = true;
    getData();
    super.onInit();
  }

  getData() async {
    loader.value = false;
    var contactDetails = await apiFetcher('Get', '/api/contact');
    data = (contactDetails['data']);
    loader.value = true;
  }

  void delete() async {
    print(updateId);
    await apiFetcher('Delete', '/api/contact/$updateId');
    getData();
  }
}
