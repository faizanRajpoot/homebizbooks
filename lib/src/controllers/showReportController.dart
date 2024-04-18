import 'package:get/get.dart';

class ShowReportController extends GetxController {
  var arg = Get.arguments;
  var ek = '';
  var name = '';
  var email = '';
  check(date) {
    for (var i = 0; i < arg['data']['activities'].length; i++) {
      ek = '';
      name = '';
      email = '';
      if (int.parse(arg['data']['activities'][i]['dayofmonth']) == date) {
        ek = arg['data']['activities'][i]['activitytype'] == 1 ? 'E' : 'K';
        name = arg['data']['activities'][i]['prospectname'];
        email = arg['data']['activities'][i]['email'];

        return;
      }
    }
  }
}
