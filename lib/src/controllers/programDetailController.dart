import 'package:get/get.dart';
import 'package:hbb/src/utils/helpers/api_helper.dart';

class ProgramDetailController extends GetxController {
  var data;
  RxBool loader = false.obs;
  @override
  void onInit() async {
    var partenerDetails =
        await apiFetcher('Get', '/api/accountability-partner');
        if (partenerDetails == null){}
    data = (partenerDetails['data']);
    loader.value = true;
    super.onInit();
  }
}
