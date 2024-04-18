// ignore_for_file: depend_on_referenced_packages, unused_import, invalid_use_of_protected_member

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hbb/src/utils/helpers/api_helper.dart';

import 'package:table_calendar/table_calendar.dart';

import '../ui/view/activity.dart';

class ActivityController extends GetxController {
  RxBool isFormatlist = false.obs;
  RxBool isCalendar = true.obs;
  RxBool expandDailyExposure = false.obs;
  RxDouble dailyExposureHeight = 0.0.obs;
  RxBool expandMeetings = false.obs;
  RxDouble meetingsHeight = 0.0.obs;
  RxBool expandConference = false.obs;
  RxDouble conferenceHeight = 0.0.obs;
  RxBool expandNationalExposure = false.obs;
  RxDouble nationalExposureHeight = 0.0.obs;
  RxBool specDateCheck = false.obs;
  String? formattedDate;
  var dailyExpense = [];
  var weeklyExpense = [];
  var conferrenceExpense = [];
  var nationalExpense = [];

  List<dynamic> checkkk = [];
  List<dynamic> checkExpense = [];

  RxBool loder = true.obs;

  var data;
  var expenseAll;

  CalendarFormat calendarFormat = CalendarFormat.month;
  final pfocusedDay = DateTime.now().obs;
  DateTime? pselectedDay;
  TextEditingController eventController = TextEditingController();
  var changeMonth = '2024-02-';

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  getData() async {
    loder.value = true;

    data = await apiFetcher('Get', '/api/activity');

    checkkk = data['data'];
    data = checkkk;
    pselectedDay = pfocusedDay.value;

    loder.value = false;
    monthlyData();
  }

  monthlyData() async {
    expenseAll = await apiFetcher('Get',
        '/api/expense?startDate=${changeMonth}01&endDate=${changeMonth}29');

    checkExpense = expenseAll['data'];
    expenseAll = checkExpense;
    dcheck();
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    pselectedDay = selectedDay;
    pfocusedDay.value = focusedDay;
    dcheck();
  }

  var filteredDataOfD = [];
  var filteredidOfD = [];
  var filteredidOfW = [];
  var filteredidOfC = [];

  var dailyprintt = [].obs;
  var natinalprint = [].obs;
  var weeklyprint = [].obs;
  var conferrencedprint = [].obs;

  dcheck() async {
    filteredDataOfD = [];
    filteredidOfD = [];
    filteredidOfW = [];
    filteredidOfC = [];
    specDateCheck.value = true;
    dailyExpense = [];
    weeklyExpense = [];
    conferrenceExpense = [];
    nationalExpense = [];

    dailyprintt.value = [];
    // expenseAll=[];
    natinalprint.value = [];
    weeklyprint.value = [];
    conferrencedprint.value = [];
    expandDailyExposure.value = false;
    expandNationalExposure.value = false;
    expandMeetings.value = false;
    expandConference.value = false;

    DateTime dateTime = DateTime.parse(pselectedDay.toString());

    dateTime = dateTime.toLocal();

    formattedDate =
        "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";

    for (var i = 0; i < data.length; i++) {
      if (data[i]['origdate'] == formattedDate) {
        filteredDataOfD.add(
            {'id': data[i]['id'], 'members_id': data[i]['members_idmembers']});
      }
    }

    if (filteredDataOfD.isNotEmpty) {
      for (var i = 0; i < filteredDataOfD.length; i++) {
        var dailyIds = await apiFetcher(
            'Get', '/api/daily-exposure/${filteredDataOfD[i]['id']}');
        filteredidOfD.add(dailyIds['data']);
        var conferIds = await apiFetcher(
            'Get', '/api/conference-call/${filteredDataOfD[i]['id']}');
        filteredidOfC.add(conferIds['data']);

        var weeklyIds = await apiFetcher(
            'Get', '/api/weekly-training/${filteredDataOfD[i]['id']}');
        filteredidOfW.add(weeklyIds['data']);
      }

      for (var i = 0; i < filteredidOfD.length; i++) {
        if (filteredidOfD[i]['activitytype'] == 1) {
          for (var j = 0; j < expenseAll.length; j++) {
            if (expenseAll[j]['activityId'] == filteredidOfD[i]['id']) {
              dailyExpense.add(expenseAll[j]);

              break;
            }
          }
          dailyprintt.value.add(filteredidOfD[i]);

          expandDailyExposure.value = true;
        }
      }

      for (var i = 0; i < filteredidOfD.length; i++) {
        if (filteredidOfD[i]['activitytype'] == 4) {
          for (var j = 0; j < expenseAll.length; j++) {
            if (expenseAll[j]['activityId'] == filteredidOfD[i]['id']) {
              nationalExpense.add(expenseAll[j]);

              break;
            }
          }
          natinalprint.value.add(filteredidOfD[i]);

          expandNationalExposure.value = true;
        }
      }

      for (var i = 0; i < filteredidOfW.length; i++) {
        if (filteredidOfW[i]['activitytype'] == 2) {
          for (var j = 0; j < expenseAll.length; j++) {
            if (expenseAll[j]['activityId'] == filteredidOfW[i]['id']) {
              weeklyExpense.add(expenseAll[j]);
              break;
            }
          }
          weeklyprint.value.add(filteredidOfW[i]);

          expandMeetings.value = true;
        }
      }
      for (var i = 0; i < filteredidOfC.length; i++) {
        if (filteredidOfD[i]['activitytype'] == 3) {
          for (var j = 0; j < expenseAll.length; j++) {
            if (expenseAll[j]['activityId'] == filteredidOfC[i]['id']) {
              conferrenceExpense.add(expenseAll[j]);
              break;
            }
          }
          conferrencedprint.value.add(filteredidOfC[i]);

          expandConference.value = true;
        }
      }
    }

    specDateCheck.value = false;
  }
}
