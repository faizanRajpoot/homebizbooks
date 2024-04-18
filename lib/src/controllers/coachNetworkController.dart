import 'package:get/get.dart';
import 'package:hbb/src/utils/helpers/api_helper.dart';

class CoachNetworkController extends GetxController {
  RxBool loader = false.obs;
  var data;
  @override
  void onInit() async {
    var coachDetails = await apiFetcher('Get', '/api/coach-network');
    data = (coachDetails['data']);
    loader.value = true;
    super.onInit();
  }
}
