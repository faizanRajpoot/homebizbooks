import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hbb/src/controllers/activityController.dart';
import 'package:hbb/src/utils/helpers/api_helper.dart';
import 'package:hbb/src/utils/routes/routes.dart';

class ConferenceCallController extends GetxController {
  dynamic refValue;
  TextEditingController timeofcall = TextEditingController();
  TextEditingController notes = TextEditingController();
  TextEditingController amount = TextEditingController();
  var check;
  ActivityController ac = Get.find<ActivityController>();
  var arg = Get.arguments;
  var formattedDate;
  var expCheck=false;


  @override
  void onInit() async {
    super.onInit();
    check = arg['check'] ?? 'Save';

    DateTime dateTime = DateTime.parse(arg['date'].toString());

    dateTime = dateTime.toLocal();

    formattedDate =
        "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
  }

  submit() async {
    var obj = check == 'Save'
        ? {
            "activitytype": 3,
            "origdate": formattedDate,
            "timeofcall": timeofcall.text,
            "ccallnotes": notes.text
          }
        : {"timeofcall": timeofcall.text, "ccallnotes": notes.text};
var res;
    if (check == 'Save') {
     res= await apiFetcher('Post', '/api/conference-call', obj);
    }
    if (check=='update') {
     res= await apiFetcher('Put', '/api/conference-call/${arg['id']}', obj);
      
    }
    if (expCheck) {
      var decode=jsonDecode(res.body);
      Get.offAndToNamed(Routes.dailyaddexpense,
          arguments: {'name': 'Conferrence Call', 'actId': decode['data']['id'],'date':formattedDate});
    } else {
      ac.getData();
      Get.back();
    }
  }
}
