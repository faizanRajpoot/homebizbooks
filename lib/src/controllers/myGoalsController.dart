import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hbb/src/utils/helpers/api_helper.dart';

class MyGoalsController extends GetxController {
  TextEditingController days = TextEditingController();
  TextEditingController income30days = TextEditingController();
  TextEditingController income6months = TextEditingController();
  TextEditingController income1year = TextEditingController();
  TextEditingController hourdays = TextEditingController();
  TextEditingController hourweek = TextEditingController();
  TextEditingController hourmonth = TextEditingController();
  TextEditingController exposureday = TextEditingController();
  TextEditingController exposureweek = TextEditingController();
  TextEditingController exposuremonth = TextEditingController();
  TextEditingController customerweek = TextEditingController();
  TextEditingController customermonth = TextEditingController();
  TextEditingController sponsorsweek = TextEditingController();
  TextEditingController sponsorsmonth = TextEditingController();
  TextEditingController rankpos1 = TextEditingController();
  TextEditingController rankpos2 = TextEditingController();
  TextEditingController rankpos3 = TextEditingController();
  TextEditingController notesController = TextEditingController();

  RxBool incomeEdit = false.obs;
  RxBool hoursEdit = false.obs;
  RxBool esposureEdit = false.obs;
  RxBool customersEdit = false.obs;
  RxBool sponsorEdit = false.obs;
  RxBool pos1Edit = false.obs;
  RxBool pos2Edit = false.obs;
  RxBool pos3Edit = false.obs;

  RxBool loader = false.obs;
  RxBool goalsText = false.obs;

// Post Apis
  void addGoalText() async {
    var notesobj = {"goal": notesController.text};
    await apiFetcher('Post', '/api/my-goal/add-goal', notesobj);
    loader.value = false;
    getData();
  }

  void addGoalIncome() async {
    var obj = {
      "income1m": income30days.text,
      "income6m": income6months.text,
      "income1y": income1year.text
    };
    if (income30days.text.isEmpty ||
        income6months.text.isEmpty ||
        income1year.text.isEmpty) {
      Get.snackbar('Error', 'Income All fields are required',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    } else {
      incomeEdit.value = false;
    }
    await apiFetcher('Post', '/api/my-goal/add-goal-income', obj);
    loader.value = false;
    getData();
  }

  void addGoalHours() async {
    var obj = {
      "timeDay": hourdays.text,
      "timeWeek": hourweek.text,
      "timeMonth": hourmonth.text
    };
    if (hourdays.text.isEmpty ||
        hourweek.text.isEmpty ||
        hourmonth.text.isEmpty) {
      Get.snackbar('Error', 'Hours All fields are required',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    } else {
      hoursEdit.value = false;
    }
    await apiFetcher('Post', '/api/my-goal/add-goal-hours', obj);
    loader.value = false;
    getData();
  }

  void addGoalExposures() async {
    var obj = {
      "exposuresDay": exposureday.text,
    "exposuresWeek": exposureweek.text,
    "exposuresMonth": exposuremonth.text
    };
    if (exposureday.text.isEmpty ||
        exposureweek.text.isEmpty ||
        exposuremonth.text.isEmpty) {
      Get.snackbar('Error', 'Exposures All fields are required',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    } else {
      esposureEdit.value = false;
    }
    await apiFetcher('Post', '/api/my-goal/add-goal-exposure', obj);
    loader.value = false;
    getData();
  }

  void addGoalCustomers() async {
    var obj = {
    "membershipsWeek": customerweek.text,
    "membershipsMonth": customermonth.text
    };
    if (customerweek.text.isEmpty ||
        customermonth.text.isEmpty ) {
      Get.snackbar('Error', 'Customers All fields are required',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    } else {
      customersEdit.value = false;
    }
    await apiFetcher('Post', '/api/my-goal/add-goal-customers', obj);
    loader.value = false;
    getData();
  }

  void addGoalSponsors() async {
    var obj = {
    "sponsorWeek": sponsorsweek.text,
    "sponsorMonth": sponsorsmonth.text,
    };
    if (sponsorsweek.text.isEmpty ||
        sponsorsmonth.text.isEmpty ) {
      Get.snackbar('Error', 'Sponsors All fields are required',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    } else {
      sponsorEdit.value = false;
    }
    await apiFetcher('Post', '/api/my-goal/add-goal-sponsors', obj);
    loader.value = false;
    getData();
  }





// Get Api
  void getData() async {
    var goals = await apiFetcher('Get', '/api/my-goal');
    why = goals['data']['why'];
    hourdays.text = goals['data']['timeday'];
    hourweek.text = goals['data']['timeweek'];
    hourmonth.text = goals['data']['timemonth'];
    exposureday.text = goals['data']['exposuresday'];
    exposureweek.text = goals['data']['exposuresweek'];
    exposuremonth.text = goals['data']['exposuresmonth'];
    customerweek.text = goals['data']['membershipsweek'];
    customermonth.text = goals['data']['membershipsmonth'];
    sponsorsweek.text = goals['data']['sponsorweek'];
    sponsorsmonth.text = goals['data']['sponsormonth'];

    var incomeChart = await apiFetcher('Get', '/api/my-goal/income-chart');
    income30days.text = incomeChart['data']['income1m'];
    income6months.text = incomeChart['data']['income6m'];
    income1year.text = incomeChart['data']['income1y'];
    actualIncome1m = incomeChart['data']['actualIncome1m'];
    actualIncome6m = incomeChart['data']['actualIncome6m'];
    actualIncome12m = incomeChart['data']['actualIncome12m'];

    var goalPosition = await apiFetcher('Get', '/api/my-goal/position');
    rankPos1 = goalPosition[2]['ultype'];
    rankPos2 = goalPosition[1]['ultype'];
    rankPos3 = goalPosition[0]['ultype'];
    posName1 = goalPosition[2]['name'];
    posName2 = goalPosition[1]['name'];
    posName3 = goalPosition[0]['name'];

    loader.value = true;
  }

  var why;
  // var income1m;
  // var income6m;
  // var income1y;
  var actualIncome1m;
  var actualIncome6m;
  var actualIncome12m;
  // var timeday;
  // var timeweek;
  // var timemonth;
  // var exposuresday;
  // var exposuresweek;
  // var exposuresmonth;
  // var membershipsweek;
  // var membershipsmonth;
  // var sponsorweek;
  // var sponsormonth;
  var posName1;
  var posName2;
  var posName3;
  var rankPos1;
  var rankPos2;
  var rankPos3;


    @override
  void onInit() {
    getData();
    super.onInit();
  }
}
