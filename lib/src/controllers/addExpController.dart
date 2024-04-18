// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hbb/src/controllers/activityController.dart';
import 'package:hbb/src/utils/helpers/api_helper.dart';

class AddExpController extends GetxController {
  var arg = Get.arguments;

  ActivityController ac = Get.find<ActivityController>();
  

  dynamic refValue;
  RxBool addExCheck = true.obs;
  TextEditingController amount = TextEditingController();

  TextEditingController milageRateText = TextEditingController();
  TextEditingController begReading = TextEditingController();
  TextEditingController endReading = TextEditingController();
  TextEditingController miles = TextEditingController();

  var addExDate;

  submit() async {
  //    var currentMonthFirstDate = DateTime.now().obs;
  // var currentMonthLastDate = DateTime.now().obs;


    // DateTime currentDate = DateTime.now();
    // currentMonthFirstDate.value = DateTime(currentDate.year, currentDate.month, 1);
    // currentMonthLastDate.value = DateTime(currentDate.year, currentDate.month + 1, 0);

  
    var id = arg['actId'];
   
    var data = {
      "expenseamount": amount.text,
      "incexp": 0, // 0 for expense and 1 for income
      "editreason": refValue,
      "incomereason": "Test Reason",
      "expensedate": arg['date'],
      "activityId": id
    };
    var res = await apiFetcher('Post', '/api/expense', data);
    ac.getData();
  }
}

// /api/expense?startDate=$currentMonthFirstDate&endDate=$currentMonthLastDate
