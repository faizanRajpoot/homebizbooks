import 'package:get/get.dart';

class IncomeExpenceRepController extends GetxController{
    var arg = Get.arguments;
  var ek = '';
  var name ;
  var email;
var data=[];

 @override
  void onInit() {

    data=arg['data']['activities'];
    super.onInit();
  }

  check(date) {
    var datee='${arg['year']}-${arg['month']<10?0:''}${arg['month'].toString()}-${date<10?0:''}$date';
    for (var i = 0; i < arg['data']['activities'].length; i++) {
      ek = '';
      name = '';
      email = '';
      if (arg['data']['activities'][i]['expensedate'] ==datee ) {
        print(datee);
        ek = arg['data']['activities'][i]['expensereason'] ;
        name = arg['data']['activities'][i]['income'];
        email = arg['data']['activities'][i]['expenseamount'];

        return;
      }
    }
  }
}