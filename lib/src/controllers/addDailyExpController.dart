// ignore_for_file: prefer_is_not_empty

import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hbb/src/controllers/activityController.dart';
import 'package:hbb/src/utils/helpers/api_helper.dart';
import 'package:hbb/src/utils/routes/routes.dart';

class AddDailyExpController extends GetxController {
  ActivityController ac = Get.find<ActivityController>();

  var arg = Get.arguments;

  var check;
  var checkbox1 = false.obs;
  var checkbox2 = false.obs;
  var checkbox3 = false.obs;
  var checkbox4 = false.obs;
  var checkbox5 = false.obs;
  var checkbox6 = false.obs;
  var checkbox7 = false.obs;
  var checkbox8 = false.obs;
  var checkbox9 = false.obs;
  var checkbox10 = false.obs;
  var checkbox11 = false.obs;
  var checkbox12 = false.obs;
  var checkbox13 = false.obs;

  TextEditingController amount = TextEditingController();
  TextEditingController prospectsName = TextEditingController();
  TextEditingController phoneNo = TextEditingController();
  TextEditingController cellPhone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController zip = TextEditingController();
  TextEditingController notes = TextEditingController();
  TextEditingController timeCall = TextEditingController();
  dynamic followUP;
  var formattedDate;
  var expCheck = false;

  @override
  void onInit() async {
    check = arg['check'] ?? 'Save';
    super.onInit();
    DateTime dateTime = DateTime.parse(arg['date'].toString());

    dateTime = dateTime.toLocal();

    formattedDate =
        "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
  }

  submit() async {
    print(followUP == null);

    if (!prospectsName.text.isEmpty &&
        !phoneNo.text.isEmpty &&
        !cellPhone.text.isEmpty &&
        !email.text.isEmpty &&
        !address.text.isEmpty &&
        !city.text.isEmpty &&
        !state.text.isEmpty &&
        !zip.text.isEmpty &&
        !notes.text.isEmpty &&
        !timeCall.text.isEmpty) {
      if (followUP == null) {
        Get.snackbar('Error', 'FollowUp date is required',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      } else {
        var dat = {
          "prospectname": prospectsName.text,
          "activitytype": arg['type'],
          "origdate": formattedDate.toString(),
          "phone": phoneNo.text,
          "cellphone": cellPhone.text,
          "email": email.text,
          "address": address.text,
          "city": city.text,
          "state": state.text,
          "zip": zip.text,
          "formnotes": notes.text,
          "calltime": timeCall.text,
          "hiddendate": followUP,
          // ignore: prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation
          "exposuretypestring": "${checkbox1.value ? 'threeway,' : ''}" +
              "${checkbox2.value ? 'bizbrief,' : ''}" +
              "${checkbox3.value ? 'bcard,' : ''}" +
              "${checkbox4.value ? 'ccall,' : ''}" +
              "${checkbox5.value ? 'dvd,' : ''}" +
              "${checkbox6.value ? 'pbr,' : ''}" +
              "${checkbox7.value ? 'packet,' : ''}" +
              "${checkbox8.value ? 'online,' : ''}" +
              "${checkbox9.value ? 'sizzle,' : ''}" +
              "${checkbox10.value ? 'flipchart,' : ''}" +
              "${checkbox11.value ? 'social,' : ''}" +
              "${checkbox12.value ? 'website,' : ''}" +
              "${checkbox13.value ? 'Other,' : ''}"
        };
        var res;
        if (check == 'Save' && arg['type'] == 1) {
          res = await apiFetcher('Post', '/api/daily-exposure', dat);
        }
        if (check == 'update' && arg['type'] == 1) {
          res =
              await apiFetcher('Put', '/api/daily-exposure/${arg['id']}', dat);
        }
        if (check == 'Save' && arg['type'] == 4) {
          res = await apiFetcher('Post', '/api/natint-exposure', dat);
        }
        if (check == 'update' && arg['type'] == 4) {
          res =
              await apiFetcher('Put', '/api/natint-exposure/${arg['id']}', dat);
        }
        if (expCheck) {
          var decode = jsonDecode(res.body);
          Get.offAndToNamed(Routes.dailyaddexpense, arguments: {
            'name': 'Daily Exposure',
            'actId': decode['data']['id'],
            'date': formattedDate
          });
        } else {
          ac.getData();
          Get.back();
        }
      }
    } else {
      Get.snackbar('Error', 'All fields are required !',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }
}
