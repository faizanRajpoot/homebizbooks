import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hbb/src/ui/view/statistics&report.dart';
import 'package:hbb/src/utils/helpers/api_helper.dart';
import 'package:hbb/src/utils/routes/routes.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

class StatisticsAndReportsController extends GetxController {
  List<ChartData>? data;
  List<DistributerSignUpData>? disSignUp;
  List<DistributerExposureData>? disExposure;
  List<CustomerSignUpData>? cusSignUp;
  List<CustomerExposureData>? cusExposure;
  var fetchData;
  RxBool loder = true.obs;
  RxString dailySelectedMonth = 'Month'.obs;
  RxString dailySelectedYear = 'Year'.obs;

  int dailyMonthLenght = 0;

  RxString conferenceSelectedMonth = 'Month'.obs;
  RxString confernceSelectedYear = 'Year'.obs;
  int confernceMonthLenght = 0;

  RxString weeklySelectedMonth = 'Month'.obs;
  RxString weeklySelectedYear = 'Year'.obs;
  int weeklyMonthLenght = 0;

  // RxString nationalSelectedMonth = 'Month'.obs;
  // RxString nationalSelectedYear = 'Year'.obs;
  // int? nationalMonthlengt;

  String arg = Get.arguments ?? '/api/daily-report';

  List months = [
    'January',
    'Febuaray',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  List years = [
    '2024',
    '2023',
    '2022',
    '2021',
    '2020',
    '2019',
    '2018',
    '2017',
    '2016',
  ];

  showReport(month, year, type) async {
    print(year);
    if (month == 0 || year == 'Year') {
      Get.snackbar('Error', 'Month or Year Is Required',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } else {
      loder.value = true;
      var data = await apiFetcher('Get',
          '/api/all-reports?month=$month&year=${int.parse(year)}&type=$type');

      if (type == 1) {
        Get.toNamed(Routes.showReports,
            arguments: {'data': data, 'month': month, 'year': int.parse(year)});
      }
      if (type == 2) {
        Get.toNamed(Routes.weeklyconfrepots,
            arguments: {'data': data, 'month': month, 'year': int.parse(year)});
      }
      if (type == 3) {
        Get.toNamed(Routes.incomeexpencereport,
            arguments: {'data': data, 'month': month, 'year': int.parse(year)});
      }
      loder.value=false;
    }
  }

  @override
  void onInit() async {
    print(arg);
    fetchData = await apiFetcher('Get', arg);
    if (arg == '/api/signup-type-report') {
      disSignUp = [DistributerSignUpData('90', fetchData[0]['exposure']=="N/A"?0:fetchData[0]['exposure'])];
      disExposure = [DistributerExposureData('90', fetchData[0]['signups']=="N/A"?0:fetchData[0]['signups'])];
      cusSignUp = [CustomerSignUpData('90', fetchData[1]['exposure']=="N/A"?0:fetchData[1]['exposure'])];
      cusExposure = [CustomerExposureData('90', fetchData[1]['signups']=="N/A"?0:fetchData[1]['signups'])];
      loder.value = false;
    } else {
      data = [
        ChartData('Jan', fetchData['01']),
        ChartData('Feb', fetchData['02']),
        ChartData('Mar', fetchData['03']),
        ChartData('Apr', fetchData['04']),
        ChartData('May', fetchData['05']),
        ChartData('Jun', fetchData['06']),
        ChartData('Jul', fetchData['07']),
        ChartData('Aug', fetchData['08']),
        ChartData('Sep', fetchData['09']),
        ChartData('Oct', fetchData['10']),
        ChartData('Nov', fetchData['11']),
        ChartData('Dec', fetchData['12']),
      ];
      loder.value = false;
    }
    // print(data[0]);
    // tooltip = TooltipBehavior(enable: true);
    super.onInit();
  }
}
