import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hbb/src/controllers/statistics&reportsController.dart';
// import 'package:hbb/src/ui/widgets/commonScaffold.dart';
import 'package:hbb/src/utils/uidata/color.dart';
import 'package:hbb/src/utils/uidata/text_styles.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// ignore: must_be_immutable
class StatisticsAndReports extends StatelessWidget {
  StatisticsAndReports({super.key});

  RxBool isFormatlist = false.obs;
  RxBool isCalendar = false.obs;

  @override
  Widget build(BuildContext context) {
    StatisticsAndReportsController _ =
        Get.find<StatisticsAndReportsController>();
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        // ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
              child: Obx(
            () => _.loder.value
                ? Center(child: CircularProgressIndicator())
                    .marginOnly(top: Get.height / 2.3)
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        // width: Get.width / 1.1,
                        // alignment: Alignment.centerLeft,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    icon: Icon(
                                      Icons.arrow_back_outlined,
                                      size: Get.width * 0.06,
                                      color: Colors.black,
                                    )),
                                Text('Statistics and Reports',
                                    style: UIDataTextStyles.headingtextbold),
                              ],
                            ),
                            Row(
                              children: [
                                Obx(
                                  () => Ink(
                                    height: Get.height * 0.045,
                                    width: Get.width * 0.13,
                                    decoration: isFormatlist.value
                                        ? const ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.horizontal(
                                                        left: Radius.circular(
                                                            100),
                                                        right: Radius.circular(
                                                            100))),
                                            color: UIDataColors.commonColor,
                                          )
                                        : const ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.horizontal(
                                                        left:
                                                            Radius.circular(90),
                                                        right: Radius.circular(
                                                            90))),
                                            color: Color.fromARGB(
                                                255, 237, 237, 237),
                                          ),
                                    child: IconButton(
                                        onPressed: () {
                                          isFormatlist.value = true;
                                          isCalendar.value = false;
                                        },
                                        icon: Icon(
                                          Icons.format_list_bulleted,
                                          size: Get.width * 0.06,
                                          color: isFormatlist.value
                                              ? Colors.white
                                              : Colors.grey,
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ).marginOnly(top: 30),
                      Container(
                        child: _.arg != '/api/signup-type-report'
                            ? Column(
                                children: [
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Reports'),
                                      Icon(Icons.keyboard_arrow_down_sharp),
                                      Spacer(),
                                      Text('Months')
                                    ],
                                  )
                                      .marginSymmetric(
                                          horizontal: Get.width * 0.03)
                                      .marginOnly(top: 45, bottom: 10),
                                  Container(
                                    height: 250,
                                    child: SfCartesianChart(
                                        primaryXAxis: CategoryAxis(
                                          labelStyle: TextStyle(fontSize: 9),
                                          interval: 1,
                                        ),
                                        primaryYAxis: NumericAxis(
                                            labelStyle: TextStyle(fontSize: 9),
                                            minimum: 0,
                                            maximum: _.arg ==
                                                    '/api/daily-report'
                                                ? 3
                                                : _.arg ==
                                                        '/api/conference-report'
                                                    ? 25
                                                    : 50,
                                            interval:
                                                _.arg == '/api/daily-report'
                                                    ? 0.5
                                                    : 5),
                                        tooltipBehavior:
                                            TooltipBehavior(enable: true),
                                        series: <CartesianSeries<ChartData,
                                            String>>[
                                          ColumnSeries<ChartData, String>(
                                              dataSource: _.data,
                                              xValueMapper:
                                                  (ChartData data, _) => data.x,
                                              yValueMapper:
                                                  (ChartData data, _) => data.y,
                                              name: 'Exposures',
                                              // yAxisName: 'lll',
                                              color: Color.fromRGBO(
                                                  0, 135, 36, 1)),
                                          // ColumnSeries<ChartData, String>(
                                          //     dataSource: _.data,
                                          //     xValueMapper: (ChartData data, _) => data.x,
                                          //     yValueMapper: (ChartData data, _) => data.z,
                                          //     name: 'Sign-Ups',
                                          //     // yAxisName: 'lll',
                                          //     color: Color.fromRGBO(0, 161, 186, 1)),
                                        ]),
                                  ),
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Distributor sign-ups: ${_.fetchData[0]['count']} or ${_.fetchData[0]['exposure']}% of all exposures',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ).marginOnly(top: 20),
                                  Text(
                                    'Customer sign-ups: ${_.fetchData[1]['count']} or ${_.fetchData[1]['exposure']}% of all exposures',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    'Distributers:',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ).marginSymmetric(vertical: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 15),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(
                                                  0.2), // Shadow color
                                              offset: Offset(
                                                -10,
                                                12,
                                              ), // Horizontal and vertical offset
                                              blurRadius: 20, // Blur radius
                                              spreadRadius:
                                                  2.0, // Spread radius (optional)
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 90,
                                              width: 160,
                                              child: SfCircularChart(
                                                  annotations: <CircularChartAnnotation>[
                                                    CircularChartAnnotation(
                                                      // position: Offset(0, 0), // Position at the center of the chart
                                                      widget: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(9),
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  width: 1,
                                                                  color: Colors
                                                                      .grey),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50)),
                                                          child: Text(
                                                            '${_.fetchData[0]['exposure']}', // Label to display
                                                            style: TextStyle(
                                                                fontSize: 15),
                                                          ),
                                                        ), // Center the label within the container
                                                      ),
                                                    )
                                                  ],
                                                  series: <CircularSeries>[
                                                    // Renders radial bar chart
                                                    RadialBarSeries<
                                                            DistributerSignUpData,
                                                            String>(
                                                        radius: '125%',
                                                        innerRadius: '60%',
                                                        trackBorderWidth: 1,
                                                        gap: '25%',
                                                        maximumValue: 100,
                                                        trackColor: Color.fromARGB(
                                                            0, 255, 255, 255),
                                                        cornerStyle: CornerStyle
                                                            .endCurve,
                                                        dataSource: _.disSignUp,
                                                        pointColorMapper:
                                                            (DistributerSignUpData data, _) => data.y > 5
                                                                ? Color.fromRGBO(
                                                                    0, 161, 186, 1)
                                                                : Color.fromRGBO(
                                                                    0, 135, 36, 1),
                                                        xValueMapper:
                                                            (DistributerSignUpData data, _) =>
                                                                data.x,
                                                        yValueMapper:
                                                            (DistributerSignUpData data,
                                                                    _) =>
                                                                data.y),
                                                  ]),
                                            ),
                                            Text(
                                              'Sign-ups',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        // color: Colors.amber,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 15),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(
                                                  0.2), // Shadow color
                                              offset: Offset(
                                                -10,
                                                12,
                                              ), // Horizontal and vertical offset
                                              blurRadius: 20, // Blur radius
                                              spreadRadius:
                                                  2.0, // Spread radius (optional)
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 90,
                                              width: 160,
                                              // color: Colors.amber,
                                              child: SfCircularChart(
                                                  annotations: <CircularChartAnnotation>[
                                                    CircularChartAnnotation(
                                                      // position: Offset(0, 0), // Position at the center of the chart
                                                      widget: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(9),
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  width: 1,
                                                                  color: Colors
                                                                      .grey),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50)),
                                                          child: Text(
                                                            '${_.fetchData[0]['signups']}', // Label to display
                                                            style: TextStyle(
                                                                fontSize: 15),
                                                          ),
                                                        ), // Center the label within the container
                                                      ),
                                                    )
                                                  ],
                                                  series: <CircularSeries>[
                                                    // Renders radial bar chart
                                                    RadialBarSeries<
                                                            DistributerExposureData,
                                                            String>(
                                                        radius: '125%',
                                                        innerRadius: '60%',
                                                        trackBorderWidth: 1,
                                                        gap: '25%',
                                                        maximumValue: 100,
                                                        trackColor:
                                                            Color.fromARGB(
                                                                0, 255, 255, 255),
                                                        cornerStyle: CornerStyle
                                                            .endCurve,
                                                        dataSource:
                                                            _.disExposure,
                                                        pointColorMapper:
                                                            (DistributerExposureData data, _) => data.y > 5
                                                                ? Color.fromRGBO(
                                                                    0, 135, 36, 1)
                                                                : Color.fromRGBO(
                                                                    0, 161, 186, 1),
                                                        xValueMapper:
                                                            (DistributerExposureData data, _) =>
                                                                data.x,
                                                        yValueMapper:
                                                            (DistributerExposureData data,
                                                                    _) =>
                                                                data.y),
                                                  ]),
                                            ),
                                            Text(
                                              'Exposures',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                    'Cutomers:',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ).marginSymmetric(vertical: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 15),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(
                                                  0.2), // Shadow color
                                              offset: Offset(
                                                -10,
                                                12,
                                              ), // Horizontal and vertical offset
                                              blurRadius: 20, // Blur radius
                                              spreadRadius:
                                                  2.0, // Spread radius (optional)
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 90,
                                              width: 160,
                                              child: SfCircularChart(
                                                  annotations: <CircularChartAnnotation>[
                                                    CircularChartAnnotation(
                                                      // position: Offset(0, 0), // Position at the center of the chart
                                                      widget: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(9),
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  width: 1,
                                                                  color: Colors
                                                                      .grey),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50)),
                                                          child: Text(
                                                            '${_.fetchData[1]['exposure']}', // Label to display
                                                            style: TextStyle(
                                                                fontSize: 15),
                                                          ),
                                                        ), // Center the label within the container
                                                      ),
                                                    )
                                                  ],
                                                  series: <CircularSeries>[
                                                    // Renders radial bar chart
                                                    RadialBarSeries<
                                                            CustomerSignUpData,
                                                            String>(
                                                        radius: '125%',
                                                        innerRadius: '60%',
                                                        trackBorderWidth: 1,
                                                        gap: '25%',
                                                        maximumValue: 100,
                                                        trackColor: Color.fromARGB(
                                                            0, 255, 255, 255),
                                                        cornerStyle: CornerStyle
                                                            .endCurve,
                                                        dataSource: _.cusSignUp,
                                                        pointColorMapper:
                                                            (CustomerSignUpData data, _) => data.y > 5
                                                                ? Color.fromRGBO(
                                                                    0, 161, 186, 1)
                                                                : Color.fromRGBO(
                                                                    0, 135, 36, 1),
                                                        xValueMapper:
                                                            (CustomerSignUpData data,
                                                                    _) =>
                                                                data.x,
                                                        yValueMapper:
                                                            (CustomerSignUpData data,
                                                                    _) =>
                                                                data.y),
                                                  ]),
                                            ),
                                            Text(
                                              'Sign-ups',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        // color: Colors.amber,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 15),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(
                                                  0.2), // Shadow color
                                              offset: Offset(
                                                -10,
                                                12,
                                              ), // Horizontal and vertical offset
                                              blurRadius: 20, // Blur radius
                                              spreadRadius:
                                                  2.0, // Spread radius (optional)
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 90,
                                              width: 160,
                                              // color: Colors.amber,
                                              child: SfCircularChart(
                                                  annotations: <CircularChartAnnotation>[
                                                    CircularChartAnnotation(
                                                      // position: Offset(0, 0), // Position at the center of the chart
                                                      widget: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(9),
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  width: 1,
                                                                  color: Colors
                                                                      .grey),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50)),
                                                          child: Text(
                                                            '${_.fetchData[1]['signups']}', // Label to display
                                                            style: TextStyle(
                                                                fontSize: 15),
                                                          ),
                                                        ), // Center the label within the container
                                                      ),
                                                    )
                                                  ],
                                                  series: <CircularSeries>[
                                                    // Renders radial bar chart
                                                    RadialBarSeries<
                                                            CustomerExposureData,
                                                            String>(
                                                        radius: '125%',
                                                        innerRadius: '60%',
                                                        trackBorderWidth: 1,
                                                        gap: '25%',
                                                        maximumValue: 100,
                                                        trackColor:
                                                            Color.fromARGB(
                                                                0, 255, 255, 255),
                                                        cornerStyle: CornerStyle
                                                            .endCurve,
                                                        dataSource:
                                                            _.cusExposure,
                                                        pointColorMapper:
                                                            (CustomerExposureData data, _) => data.y > 5
                                                                ? Color.fromRGBO(
                                                                    0, 135, 36, 1)
                                                                : Color.fromRGBO(
                                                                    0, 161, 186, 1),
                                                        xValueMapper:
                                                            (CustomerExposureData data, _) =>
                                                                data.x,
                                                        yValueMapper:
                                                            (CustomerExposureData data,
                                                                    _) =>
                                                                data.y),
                                                  ]),
                                            ),
                                            Text(
                                              'Exposures',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'All Reports',
                            style: UIDataTextStyles.subheadingtextbold,
                          ),
                          Spacer(),
                          Text('Months'),
                          Icon(Icons.arrow_drop_down_rounded),
                        ],
                      ).marginOnly(top: 40),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Daily & Natinal\nInternational Exposure ',
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.bottomSheet(Container(
                                      padding:
                                          EdgeInsets.only(top: 50, bottom: 50),
                                      height: 300,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 213, 213, 213),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Center(
                                        child: Container(
                                          height: 200,
                                          child: ListView.builder(
                                              itemCount: _.months.length,
                                              // physics: ,
                                              itemBuilder:
                                                  (BuildContext context, i) {
                                                return InkWell(
                                                  onTap: () {
                                                    _.dailyMonthLenght = i + 1;
                                                    _.dailySelectedMonth.value =
                                                        _.months[i];
                                                    Get.back();
                                                  },
                                                  child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        _.months[i],
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                      )).marginOnly(bottom: 7),
                                                );
                                              }),
                                        ),
                                      )));
                                },
                                child: Container(
                                  padding: EdgeInsets.only(left: 7, right: 3),
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 238, 238, 238),
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(2)),
                                  child: Obx(() => Row(
                                        children: [
                                          Text(_.dailySelectedMonth.value,
                                              style: TextStyle(
                                                  fontSize: 9,
                                                  fontWeight: FontWeight.w600)),
                                          Icon(
                                            Icons.keyboard_arrow_down_sharp,
                                            size: 15,
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  print('dailyye');
                                  Get.bottomSheet(Container(
                                      padding:
                                          EdgeInsets.only(top: 50, bottom: 50),
                                      height: 300,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 213, 213, 213),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Center(
                                        child: Container(
                                          height: 200,
                                          child: ListView.builder(
                                              itemCount: _.years.length,
                                              itemBuilder:
                                                  (BuildContext context, i) {
                                                return InkWell(
                                                  onTap: () {
                                                    print(int.parse(_.years[i])
                                                        .runtimeType);
                                                    _.dailySelectedYear.value =
                                                        _.years[i];
                                                    Get.back();
                                                  },
                                                  child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        _.years[i],
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                      )).marginOnly(bottom: 7),
                                                );
                                              }),
                                        ),
                                      )));
                                },
                                child: Container(
                                  padding: EdgeInsets.only(left: 7, right: 3),
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 238, 238, 238),
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(2)),
                                  child: Obx(() => Row(
                                        children: [
                                          Text(_.dailySelectedYear.value,
                                              style: TextStyle(
                                                  fontSize: 9,
                                                  fontWeight: FontWeight.w600)),
                                          Icon(
                                            Icons.keyboard_arrow_down_sharp,
                                            size: 15,
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  _.showReport(_.dailyMonthLenght,
                                      _.dailySelectedYear.value, 1);
                                },
                                child: Text('Show reports',
                                    style: TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ).marginOnly(top: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Weekly Meetings &\nConference Calls Report',
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                onTap: () {
                                  print('conmo');
                                  Get.bottomSheet(Container(
                                      padding:
                                          EdgeInsets.only(top: 50, bottom: 50),
                                      height: 300,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 213, 213, 213),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Center(
                                        child: Container(
                                          height: 200,
                                          child: ListView.builder(
                                              itemCount: _.months.length,
                                              // physics: ,
                                              itemBuilder:
                                                  (BuildContext context, i) {
                                                return InkWell(
                                                  onTap: () {
                                                    _.confernceMonthLenght =
                                                        i + 1;
                                                    _.conferenceSelectedMonth
                                                        .value = _.months[i];
                                                    Get.back();
                                                  },
                                                  child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        _.months[i],
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                      )).marginOnly(bottom: 7),
                                                );
                                              }),
                                        ),
                                      )));
                                },
                                child: Container(
                                  padding: EdgeInsets.only(left: 7, right: 3),
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 238, 238, 238),
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(2)),
                                  child: Obx(() => Row(
                                        children: [
                                          Text(_.conferenceSelectedMonth.value,
                                              style: TextStyle(
                                                  fontSize: 9,
                                                  fontWeight: FontWeight.w600)),
                                          Icon(
                                            Icons.keyboard_arrow_down_sharp,
                                            size: 15,
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  print('confYea');
                                  Get.bottomSheet(Container(
                                      padding:
                                          EdgeInsets.only(top: 50, bottom: 50),
                                      height: 300,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 213, 213, 213),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Center(
                                        child: Container(
                                          height: 200,
                                          child: ListView.builder(
                                              itemCount: _.years.length,
                                              // physics: ,
                                              itemBuilder:
                                                  (BuildContext context, i) {
                                                return InkWell(
                                                  onTap: () {
                                                    _.confernceSelectedYear
                                                        .value = _.years[i];
                                                    Get.back();
                                                  },
                                                  child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        _.years[i],
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                      )).marginOnly(bottom: 7),
                                                );
                                              }),
                                        ),
                                      )));
                                },
                                child: Container(
                                  padding: EdgeInsets.only(left: 7, right: 3),
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 238, 238, 238),
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(2)),
                                  child: Obx(() => Row(
                                        children: [
                                          Text(_.confernceSelectedYear.value,
                                              style: TextStyle(
                                                  fontSize: 9,
                                                  fontWeight: FontWeight.w600)),
                                          Icon(
                                            Icons.keyboard_arrow_down_sharp,
                                            size: 15,
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  _.showReport(_.confernceMonthLenght,
                                      _.confernceSelectedYear.value, 2);
                                },
                                child: Text('Show reports',
                                    style: TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ).marginOnly(top: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Income & Expenses Report',
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                onTap: () {
                                  print('weem');
                                  Get.bottomSheet(Container(
                                      padding:
                                          EdgeInsets.only(top: 50, bottom: 50),
                                      height: 300,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 213, 213, 213),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Center(
                                        child: Container(
                                          height: 200,
                                          child: ListView.builder(
                                              itemCount: _.months.length,
                                              // physics: ,
                                              itemBuilder:
                                                  (BuildContext context, i) {
                                                return InkWell(
                                                  onTap: () {
                                                    _.weeklyMonthLenght = i + 1;
                                                    _.weeklySelectedMonth
                                                        .value = _.months[i];
                                                    Get.back();
                                                  },
                                                  child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        _.months[i],
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                      )).marginOnly(bottom: 7),
                                                );
                                              }),
                                        ),
                                      )));
                                },
                                child: Container(
                                  padding: EdgeInsets.only(left: 7, right: 3),
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 238, 238, 238),
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(2)),
                                  child: Obx(() => Row(
                                        children: [
                                          Text(_.weeklySelectedMonth.value,
                                              style: TextStyle(
                                                  fontSize: 9,
                                                  fontWeight: FontWeight.w600)),
                                          Icon(
                                            Icons.keyboard_arrow_down_sharp,
                                            size: 15,
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.bottomSheet(Container(
                                      padding:
                                          EdgeInsets.only(top: 50, bottom: 50),
                                      height: 300,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 213, 213, 213),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Center(
                                        child: Container(
                                          height: 200,
                                          child: ListView.builder(
                                              itemCount: _.years.length,
                                              // physics: ,
                                              itemBuilder:
                                                  (BuildContext context, i) {
                                                return InkWell(
                                                  onTap: () {
                                                    _.weeklySelectedYear.value =
                                                        _.years[i];
                                                    Get.back();
                                                  },
                                                  child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        _.years[i],
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                      )).marginOnly(bottom: 7),
                                                );
                                              }),
                                        ),
                                      )));
                                },
                                child: Container(
                                  padding: EdgeInsets.only(left: 7, right: 3),
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 238, 238, 238),
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(2)),
                                  child: Obx(() => Row(
                                        children: [
                                          Text(_.weeklySelectedYear.value,
                                              style: TextStyle(
                                                  fontSize: 9,
                                                  fontWeight: FontWeight.w600)),
                                          Icon(
                                            Icons.keyboard_arrow_down_sharp,
                                            size: 15,
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  _.showReport(_.weeklyMonthLenght,
                                      _.weeklySelectedYear.value, 3);
                                },
                                child: Text('Show reports',
                                    style: TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ).marginOnly(top: 30),
                        ],
                      ).marginSymmetric(horizontal: 13)
                    ],
                  ).paddingSymmetric(horizontal: Get.width * 0.03),
          )),
        ));
  }
}

class ChartData {
  ChartData(
    this.x,
    this.y,
  );

  final String x;
  var y;
  // final double z;
}

class DistributerSignUpData {
  DistributerSignUpData(this.x, this.y);

  final String x;
  final int y;
}

class DistributerExposureData {
  DistributerExposureData(
    this.x,
    this.y,
  );

  final String x;
  final int y;
}

class CustomerSignUpData {
  CustomerSignUpData(this.x, this.y);

  final String x;
  final int y;
}

class CustomerExposureData {
  CustomerExposureData(
    this.x,
    this.y,
  );

  final String x;
  final int y;
}
