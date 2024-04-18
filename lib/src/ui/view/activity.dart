import 'package:flutter/material.dart';
import 'package:hbb/src/utils/routes/routes.dart';
import 'package:hbb/src/utils/uidata/color.dart';
import 'package:hbb/src/utils/uidata/text_styles.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:get/get.dart';
import 'package:hbb/src/controllers/activityController.dart';
import 'package:table_calendar/table_calendar.dart';

class ActivityScreen extends StatelessWidget {
  final ActivityController _ = Get.find<ActivityController>();

  ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIDataColors.greyColor,
      body: body(context),
    );
  }

  Widget body(context) {
    return SafeArea(
      child: SlidingUpPanel(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: const [BoxShadow(color: Colors.white)],
        minHeight: Get.height / 2.5,
        maxHeight: Get.height,
        panel: Column(
          children: [
            Container(
              width: Get.width * 0.2,
              height: Get.height * 0.006,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 222, 222, 222),
                  borderRadius: BorderRadius.circular(100)),
            ).paddingOnly(top: 10),

            Obx(
              () => _.specDateCheck.value
                  ? Center(child: CircularProgressIndicator())
                      .marginOnly(top: 160)
                  : Container(
                      height: Get.height / 1.1,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: const [
                                    UIDataColors.commonColor,
                                    Colors.black
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  stops: const [0.2, 2.9],
                                  tileMode: TileMode.clamp,
                                ),
                              ),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      if (_.dailyprintt.isNotEmpty) {
                                        _.expandDailyExposure.value =
                                            !_.expandDailyExposure.value;
                                      }
                                      // _.dcheck();
                                    },
                                    child: Text(
                                      'Daily Exposures',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: Get.width * 0.035,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                      onPressed: () {
                                        Get.toNamed(Routes.adddailyexp,
                                            arguments: {
                                              'type': 1,
                                              'date': _.pselectedDay
                                            });
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 30,
                                      ))
                                ],
                              ).marginSymmetric(
                                horizontal: Get.width * 0.04,
                              ),
                            ).paddingOnly(top: Get.height * 0.03),
                            Obx(
                              () => _.expandDailyExposure.value
                                  ? Container(
                                      height:
                                          _.expandDailyExposure.value ? 450 : 0,
                                      // color: Colors.green,
                                      child: ListView.builder(
                                          itemCount: _.dailyprintt.length,
                                          itemBuilder:
                                              (BuildContext context, i) {
                                            var expcheck = false;
                                            var expencex;

                                            if (_.dailyExpense.isNotEmpty) {
                                              for (var j = 0;
                                                  j < _.dailyExpense.length;
                                                  j++) {
                                                if (_.dailyprintt[i]['id'] ==
                                                    _.dailyExpense[j]
                                                        ['activityId']) {
                                                  expencex = _.dailyExpense[j];
                                                  expcheck = true;
                                                }
                                              }
                                            }

                                            return Container(
                                              // height: 410,
                                              // color: Colors.amberAccent,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 10),
                                                    color: Color.fromARGB(
                                                        255, 241, 241, 241),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text('Prospect Name:'),
                                                        Container(
                                                            width:
                                                                Get.width / 4,
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                                '${_.dailyprintt[i]['prospectname']}',
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis)),
                                                        InkWell(
                                                          onTap: () {
                                                            DateTime dateTime =
                                                                DateTime.parse(_
                                                                    .pselectedDay
                                                                    .toString());

                                                            dateTime = dateTime
                                                                .toLocal();

                                                            var formattedDate =
                                                                "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";

                                                            Get.toNamed(
                                                                Routes
                                                                    .dailyaddexpense,
                                                                arguments: {
                                                                  'name':
                                                                      'Daily Exposure',
                                                                  'actId':
                                                                      _.dailyprintt[
                                                                              i]
                                                                          [
                                                                          'id'],
                                                                  'date':formattedDate
                                                                });
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .monetization_on,
                                                            size: 18,
                                                          ),
                                                        ),
                                                        InkWell(
                                                            onTap: () {
                                                              Get.toNamed(
                                                                  Routes
                                                                      .adddailyexp,
                                                                  arguments: {
                                                                    'check':
                                                                        'update',
                                                                    'type': 1,
                                                                    'date': _
                                                                        .pselectedDay,
                                                                    'id': _.dailyprintt[
                                                                        i]['id']
                                                                  });
                                                            },
                                                            child: Icon(
                                                              Icons.edit,
                                                              size: 15,
                                                            )),
                                                        Icon(
                                                          Icons.delete,
                                                          size: 15,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 10),
                                                    color: Color.fromARGB(
                                                        255, 241, 241, 241),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                            width: 200,
                                                            child:
                                                                Text('Phone:')),
                                                        Text(
                                                            '${_.dailyprintt[i]['phone']}',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 10),
                                                    color: Color.fromARGB(
                                                        255, 241, 241, 241),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                            width: 200,
                                                            child: Text(
                                                                'Cellphone:')),
                                                        Text(
                                                            '${_.dailyprintt[i]['cellphone']}',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 10),
                                                    color: Color.fromARGB(
                                                        255, 241, 241, 241),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                            width: 200,
                                                            child:
                                                                Text('Email:')),
                                                        Container(
                                                          width: Get.width / 3,
                                                          child: Text(
                                                              '${_.dailyprintt[i]['email']}',
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 10),
                                                    color: Color.fromARGB(
                                                        255, 241, 241, 241),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                            width: 200,
                                                            child: Text(
                                                                'Address:')),
                                                        Text(
                                                            '${_.dailyprintt[i]['address']}',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 10),
                                                    color: Color.fromARGB(
                                                        255, 241, 241, 241),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                            width: 200,
                                                            child: Text(
                                                                'State/Zip:')),
                                                        Text(
                                                            '${_.dailyprintt[i]['state']},${_.dailyprintt[i]['zip']}',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 10),
                                                    color: Color.fromARGB(
                                                        255, 241, 241, 241),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                            width: 200,
                                                            child:
                                                                Text('Notes:')),
                                                        Text(
                                                            '${_.dailyprintt[i]['formnotes']}',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 10),
                                                    color: Color.fromARGB(
                                                        255, 241, 241, 241),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                            width: 200,
                                                            child: Text(
                                                                'Follow Up:')),
                                                        Text(
                                                            '${_.dailyprintt[i]['hiddendate']}',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 10),
                                                    color: Color.fromARGB(
                                                        255, 241, 241, 241),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                            width: 200,
                                                            child: Text(
                                                                'Best Time To Call:')),
                                                        Text(
                                                            '${_.dailyprintt[i]['calltime']}',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 10),
                                                    color: Color.fromARGB(
                                                        255, 241, 241, 241),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                            width: 200,
                                                            child: Text(
                                                                'Methods of Exposures:')),
                                                        Container(
                                                          width: 100,
                                                          child: Text(
                                                              '${_.dailyprintt[i]['exposuretypestring']}',
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  expcheck
                                                      ? Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10,
                                                                  vertical: 10),
                                                          color: Color.fromARGB(
                                                              255,
                                                              241,
                                                              241,
                                                              241),
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                  width: 200,
                                                                  child: Text(
                                                                      'Expence:')),
                                                              Container(
                                                                width: 100,
                                                                child: Text(
                                                                    '${expencex['expenseamount']} for ${expencex['expensereason']}',
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      : SizedBox(),
                                                  Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10),
                                                      color: Color.fromARGB(
                                                          255, 241, 241, 241),
                                                      child: Divider())
                                                ],
                                              ),
                                            );
                                          }),
                                    )
                                  : SizedBox(),
                            ),

                            // Meetings
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: const [
                                    UIDataColors.commonColor,
                                    Colors.black
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  stops: const [0.2, 2.9],
                                  tileMode: TileMode.clamp,
                                ),
                              ),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      if (_.weeklyprint.isNotEmpty) {
                                        _.expandMeetings.value =
                                            !_.expandMeetings.value;
                                      }
                                    },
                                    child: Text(
                                      'Weekly Meetings',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: Get.width * 0.035,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                      onPressed: () {
                                        // Get.toNamed(Routes.weeklymeeting);
                                        Get.toNamed(Routes.weeklymeeting,
                                            arguments: {
                                              'type': 2,
                                              'date': _.pselectedDay
                                            });
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 30,
                                      ))
                                ],
                              ).marginSymmetric(
                                horizontal: Get.width * 0.04,
                              ),
                            ).paddingOnly(top: Get.height * 0.03),
                            Obx(
                              () => _.expandMeetings.value
                                  ? Container(
                                      height: _.expandMeetings.value ? 150 : 0,
                                      // color: Colors.green,
                                      child: ListView.builder(
                                          itemCount: _.weeklyprint.length,
                                          itemBuilder:
                                              (BuildContext context, i) {
                                            var expcheck = false;
                                            var expencex;

                                            if (_.weeklyExpense.isNotEmpty) {
                                              for (var j = 0;
                                                  j < _.weeklyExpense.length;
                                                  j++) {
                                                if (_.weeklyprint[i]['id'] ==
                                                    _.weeklyExpense[j]
                                                        ['activityId']) {
                                                  expencex = _.weeklyExpense[j];
                                                  expcheck = true;
                                                }
                                              }
                                            }

                                            return Container(
                                              // height: 410,
                                              // color: Colors.amberAccent,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 10),
                                                    color: Color.fromARGB(
                                                        255, 241, 241, 241),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                            'Meeting location:'),
                                                        Container(
                                                            width:
                                                                Get.width / 4,
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                                '${_.weeklyprint[i]['meetinglocation']}',
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis)),
                                                        Icon(
                                                          Icons.monetization_on,
                                                          size: 18,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            Get.toNamed(
                                                                Routes
                                                                    .weeklymeeting,
                                                                arguments: {
                                                                  'check':
                                                                      'update',
                                                                  'type': 2,
                                                                  'date': _
                                                                      .pselectedDay,
                                                                  'id':
                                                                      _.weeklyprint[
                                                                              i]
                                                                          ['id']
                                                                });
                                                          },
                                                          child: Icon(
                                                            Icons.edit,
                                                            size: 15,
                                                          ),
                                                        ),
                                                        Icon(
                                                          Icons.delete,
                                                          size: 15,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 10),
                                                    color: Color.fromARGB(
                                                        255, 241, 241, 241),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                            width: 200,
                                                            child: Text(
                                                                'Type of Meetings:')),
                                                        Container(
                                                          width: Get.width / 4,
                                                          child: Text(
                                                              '${_.weeklyprint[i]['meetingtype']}',
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 10),
                                                    color: Color.fromARGB(
                                                        255, 241, 241, 241),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                            width: 200,
                                                            child: Text(
                                                                'Parties Present/Notes:')),
                                                        Container(
                                                          width: Get.width / 4,
                                                          child: Text(
                                                              '${_.weeklyprint[i]['wmnotes']}',
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  expcheck
                                                      ? Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10,
                                                                  vertical: 10),
                                                          color: Color.fromARGB(
                                                              255,
                                                              241,
                                                              241,
                                                              241),
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                  width: 200,
                                                                  child: Text(
                                                                      'Expence:')),
                                                              Container(
                                                                width: 100,
                                                                child: Text(
                                                                    '${expencex['expenseamount']} for ${expencex['expensereason']}',
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      : SizedBox(),
                                                  Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10),
                                                      color: Color.fromARGB(
                                                          255, 241, 241, 241),
                                                      child: Divider())
                                                ],
                                              ),
                                            );
                                          }),
                                    )
                                  : SizedBox(),
                            ),

                            // Conference Calls
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: const [
                                    UIDataColors.commonColor,
                                    Colors.black
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  stops: const [0.2, 2.9],
                                  tileMode: TileMode.clamp,
                                ),
                              ),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      if (_.conferrencedprint.isNotEmpty) {
                                        _.expandConference.value =
                                            !_.expandConference.value;
                                      }
                                    },
                                    child: Text(
                                      'Conference Calls',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: Get.width * 0.035,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                      onPressed: () {
                                        Get.toNamed(Routes.conferencecall,
                                            arguments: {
                                              'type': 3,
                                              'date': _.pselectedDay
                                            });
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 30,
                                      ))
                                ],
                              ).marginSymmetric(horizontal: Get.width * 0.04),
                            ).paddingOnly(top: Get.height * 0.03),
                            Obx(
                              () => _.expandConference.value
                                  ? Container(
                                      height:
                                          _.expandConference.value ? 100 : 0,
                                      // color: Colors.green,
                                      child: ListView.builder(
                                          itemCount: _.conferrencedprint.length,
                                          itemBuilder:
                                              (BuildContext context, i) {
                                            var expcheck = false;
                                            var expencex;

                                            if (_.conferrenceExpense
                                                .isNotEmpty) {
                                              for (var j = 0;
                                                  j <
                                                      _.conferrenceExpense
                                                          .length;
                                                  j++) {
                                                if (_.conferrencedprint[i]
                                                        ['id'] ==
                                                    _.conferrenceExpense[j]
                                                        ['activityId']) {
                                                  expencex =
                                                      _.conferrenceExpense[j];
                                                  expcheck = true;
                                                }
                                              }
                                            }

                                            return Container(
                                              // height: 410,
                                              // color: Colors.amberAccent,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 10),
                                                    color: Color.fromARGB(
                                                        255, 241, 241, 241),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text('Time of Calls:'),
                                                        Container(
                                                            width: 110,
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                                '${_.conferrencedprint[i]['timeofcall']}',
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis)),
                                                        Icon(
                                                          Icons.monetization_on,
                                                          size: 18,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            Get.toNamed(
                                                                Routes
                                                                    .conferencecall,
                                                                arguments: {
                                                                  'check':
                                                                      'update',
                                                                  'type': 3,
                                                                  'date': _
                                                                      .pselectedDay,
                                                                  'id':
                                                                      _.conferrencedprint[
                                                                              i]
                                                                          ['id']
                                                                });
                                                          },
                                                          child: Icon(
                                                            Icons.edit,
                                                            size: 15,
                                                          ),
                                                        ),
                                                        Icon(
                                                          Icons.delete,
                                                          size: 15,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 10),
                                                    color: Color.fromARGB(
                                                        255, 241, 241, 241),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                            width:
                                                                Get.width / 4,
                                                            child:
                                                                Text('Notes:')),
                                                        Container(
                                                          width: Get.width / 2,
                                                          child: Text(
                                                              '${_.conferrencedprint[i]['ccallnotes']}',
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  expcheck
                                                      ? Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10,
                                                                  vertical: 10),
                                                          color: Color.fromARGB(
                                                              255,
                                                              241,
                                                              241,
                                                              241),
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                  width: 200,
                                                                  child: Text(
                                                                      'Expence:')),
                                                              Container(
                                                                width: 100,
                                                                child: Text(
                                                                    '${expencex['expenseamount']} for ${expencex['expensereason']}',
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      : SizedBox(),
                                                  Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10),
                                                      color: Color.fromARGB(
                                                          255, 241, 241, 241),
                                                      child: Divider())
                                                ],
                                              ),
                                            );
                                          }),
                                    )
                                  : SizedBox(),
                            ),

                            // National/International Exposures
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: const [
                                    UIDataColors.commonColor,
                                    Colors.black
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  stops: const [0.2, 2.9],
                                  tileMode: TileMode.clamp,
                                ),
                              ),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      if (_.natinalprint.isNotEmpty) {
                                        _.expandNationalExposure.value =
                                            !_.expandNationalExposure.value;
                                      }
                                    },
                                    child: Text(
                                      'National/International',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: Get.width * 0.035,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                      onPressed: () {
                                        Get.toNamed(Routes.adddailyexp,
                                            arguments: {
                                              'type': 4,
                                              'date': _.pselectedDay
                                            });
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 30,
                                      ))
                                ],
                              ).marginSymmetric(horizontal: Get.width * 0.04),
                            ).paddingOnly(top: Get.height * 0.03),
                            Obx(() => _.expandNationalExposure.value
                                ? Container(
                                    height: 450,
                                    // color: Colors.green,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: _.natinalprint.length,
                                        itemBuilder: (BuildContext context, i) {
                                          var expcheck = false;
                                          var expencex;

                                          if (_.nationalExpense.isNotEmpty) {
                                            for (var j = 0;
                                                j < _.nationalExpense.length;
                                                j++) {
                                              if (_.natinalprint[i]['id'] ==
                                                  _.nationalExpense[j]
                                                      ['activityId']) {
                                                expencex = _.nationalExpense[j];
                                                expcheck = true;
                                              }
                                            }
                                          }
                                          return Container(
                                            // height: 410,
                                            // color: Colors.amberAccent,
                                            child: Column(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 10),
                                                  color: Color.fromARGB(
                                                      255, 241, 241, 241),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text('Prospect Name:'),
                                                      Container(
                                                          width: Get.width / 4,
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                              '${_.natinalprint[i]['prospectname']}',
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis)),
                                                      Icon(
                                                        Icons.monetization_on,
                                                        size: 18,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          Get.toNamed(
                                                              Routes
                                                                  .adddailyexp,
                                                              arguments: {
                                                                'check':
                                                                    'update',
                                                                'type': 4,
                                                                'date': _
                                                                    .pselectedDay,
                                                                'id':
                                                                    _.natinalprint[
                                                                        i]['id']
                                                              });
                                                        },
                                                        child: Icon(
                                                          Icons.edit,
                                                          size: 15,
                                                        ),
                                                      ),
                                                      Icon(
                                                        Icons.delete,
                                                        size: 15,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 10),
                                                  color: Color.fromARGB(
                                                      255, 241, 241, 241),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                          width: 200,
                                                          child:
                                                              Text('Phone:')),
                                                      Text(
                                                          '${_.natinalprint[i]['phone']}',
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 10),
                                                  color: Color.fromARGB(
                                                      255, 241, 241, 241),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                          width: 200,
                                                          child: Text(
                                                              'Cellphone:')),
                                                      Text(
                                                          '${_.natinalprint[i]['cellphone']}',
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 10),
                                                  color: Color.fromARGB(
                                                      255, 241, 241, 241),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                          width: 200,
                                                          child:
                                                              Text('Email:')),
                                                      Container(
                                                        width: Get.width / 4,
                                                        child: Text(
                                                            '${_.natinalprint[i]['email']}',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 10),
                                                  color: Color.fromARGB(
                                                      255, 241, 241, 241),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                          width: 200,
                                                          child:
                                                              Text('Address:')),
                                                      Text(
                                                          '${_.natinalprint[i]['address']}',
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 10),
                                                  color: Color.fromARGB(
                                                      255, 241, 241, 241),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                          width: 200,
                                                          child: Text(
                                                              'State/Zip:')),
                                                      Text(
                                                          '${_.natinalprint[i]['state']},${_.natinalprint[i]['zip']}',
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 10),
                                                  color: Color.fromARGB(
                                                      255, 241, 241, 241),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                          width: 200,
                                                          child:
                                                              Text('Notes:')),
                                                      Text(
                                                          '${_.natinalprint[i]['formnotes']}',
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 10),
                                                  color: Color.fromARGB(
                                                      255, 241, 241, 241),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                          width: 200,
                                                          child: Text(
                                                              'Follow Up:')),
                                                      Text(
                                                          '${_.natinalprint[i]['hiddendate']}',
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 10),
                                                  color: Color.fromARGB(
                                                      255, 241, 241, 241),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                          width: 200,
                                                          child: Text(
                                                              'Best Time To Call:')),
                                                      Text(
                                                          '${_.natinalprint[i]['calltime']}',
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 10),
                                                  color: Color.fromARGB(
                                                      255, 241, 241, 241),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                          width: 200,
                                                          child: Text(
                                                              'Methods of Exposures:')),
                                                      Text(
                                                          '${_.natinalprint[i]['exposuretypestring']}',
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis),
                                                    ],
                                                  ),
                                                ),
                                                expcheck
                                                    ? Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10,
                                                                vertical: 10),
                                                        color: Color.fromARGB(
                                                            255, 241, 241, 241),
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                                width: 200,
                                                                child: Text(
                                                                    'Expence:')),
                                                            Container(
                                                              width: 100,
                                                              child: Text(
                                                                  '${expencex['expenseamount']} for ${expencex['expensereason']}',
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    : SizedBox(),
                                                Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10),
                                                    color: Color.fromARGB(
                                                        255, 241, 241, 241),
                                                    child: Divider())
                                              ],
                                            ),
                                          );
                                        }),
                                  )
                                : SizedBox()),
                          ],
                        ),
                      ),
                    ),
            ),
            // Daily Exposures
          ],
        ).marginSymmetric(horizontal: Get.width * 0.05),
        body: SizedBox(
            width: Get.width,
            child: Column(
              children: [
                Container(
                  // width: Get.width / 1.1,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back_outlined,
                          size: Get.width * 0.05,
                          color: Colors.black,
                        ),
                      ),
                      Text('My Activity Calendar',
                              style: UIDataTextStyles.headingtextbold
                              // textAlign: TextAlign.left,
                              )
                          .paddingSymmetric(horizontal: Get.width * 0.015),
                      Spacer(),
                      Obx(
                        () => Ink(
                          height: Get.height * 0.04,
                          width: Get.width * 0.13,
                          decoration: _.isCalendar.value
                              ? const ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.horizontal(
                                          left: Radius.circular(100),
                                          right: Radius.circular(100))),
                                  color: UIDataColors.commonColor,
                                )
                              : null,
                          child: IconButton(
                              onPressed: () {
                                _.isCalendar.value = true;
                                _.isFormatlist.value = false;
                              },
                              icon: Icon(
                                Icons.date_range_outlined,
                                size: Get.width * 0.055,
                                color: _.isCalendar.value
                                    ? Colors.white
                                    : Colors.grey,
                              )),
                        ),
                      ),
                      Obx(
                        () => Ink(
                          height: Get.height * 0.04,
                          width: Get.width * 0.13,
                          decoration: _.isFormatlist.value
                              ? const ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.horizontal(
                                          left: Radius.circular(100),
                                          right: Radius.circular(100))),
                                  color: UIDataColors.commonColor,
                                )
                              : null,
                          child: IconButton(
                              onPressed: () {
                                _.isFormatlist.value = true;
                                _.isCalendar.value = false;
                              },
                              icon: Icon(
                                Icons.format_list_bulleted,
                                size: Get.width * 0.055,
                                color: _.isFormatlist.value
                                    ? Colors.white
                                    : Colors.grey,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: Get.width / 1.1,
                  height: Get.height / 2.2,
                  child: Column(
                    children: [
                      Obx(
                        () => _.loder.value
                            ? Center(child: CircularProgressIndicator())
                            : TableCalendar(
                                onPageChanged: (focusedDay) {
                                  DateTime dateTime =
                                      DateTime.parse(focusedDay.toString());

                                  dateTime = dateTime.toLocal();

                                  var formattedDate =
                                      "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
                                  _.changeMonth = formattedDate.substring(
                                      0, formattedDate.length - 2);
                                  _.monthlyData(); // print(formattedDate.substring(0,formattedDate.length-2));
                                },
                                headerStyle:
                                    HeaderStyle(formatButtonVisible: false),
                                calendarStyle: CalendarStyle(
                                  selectedDecoration: BoxDecoration(
                                      color: UIDataColors.commonColor,
                                      shape: BoxShape.circle),
                                  todayDecoration: BoxDecoration(
                                    color: Color.fromARGB(133, 242, 25,
                                        79), // Set your desired color for today's date
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                firstDay: DateTime.utc(2010, 10, 16),
                                lastDay: DateTime.now(),
                                focusedDay: _.pfocusedDay.value,
                                selectedDayPredicate: (day) =>
                                    isSameDay(_.pselectedDay, day),
                                calendarFormat: _.calendarFormat,
                                startingDayOfWeek: StartingDayOfWeek.monday,
                                onDaySelected: _.onDaySelected,
                                calendarBuilders: CalendarBuilders(
                                  markerBuilder: (
                                    context,
                                    date,
                                    events,
                                    // ignore: body_might_complete_normally_nullable
                                  ) {
                                    DateTime dateTime =
                                        DateTime.parse(date.toString());

                                    dateTime = dateTime.toLocal();

                                    String formattedDate =
                                        "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";

                                    for (var i = 0; i < _.checkkk.length; i++) {
                                      if (_.checkkk[i]['origdate'] ==
                                          formattedDate) {
                                        return Text(
                                          '●',
                                          style: TextStyle(
                                            color: UIDataColors.commonColor,
                                            fontSize: 8.0,
                                          ),
                                        );
                                      }
                                    }
                                  },
                                ),
                              ),
                      ),
                    ],
                  ),
                ).paddingOnly(top: Get.height * 0.02)
              ],
            )).paddingSymmetric(horizontal: Get.width * 0.025),
      ),
    );
  }
}
