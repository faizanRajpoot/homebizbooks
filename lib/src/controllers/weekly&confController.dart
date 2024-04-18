import 'package:get/get.dart';

class WeeklyConfController extends GetxController{
    var arg = Get.arguments;
  var ek = '';
  var name = '';
  var email = '';
  check(date) {
    print(arg['data']['activities']);
    for (var i = 0; i < arg['data']['activities'].length; i++) {
      ek = '';
      name = '';
      email = '';
      if (int.parse(arg['data']['activities'][i]['dayofmonth']) == date) {
        ek = arg['data']['activities'][i]['meetingtype'] ;
        name = arg['data']['activities'][i]['meetinglocation'];
        // email = arg['data']['activities'][i]['email'];

        return;
      }
    }
  }
}