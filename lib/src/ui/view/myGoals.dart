// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hbb/src/controllers/myGoalsController.dart';
import 'package:hbb/src/ui/widgets/commonClasses.dart';
import 'package:hbb/src/utils/uidata/text_styles.dart';
// import 'package:hbb/src/utils/routes/routes.dart';

class MyGoalScreen extends StatelessWidget {
  final MyGoalsController _ = Get.put(MyGoalsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      // ),
      body: Obx(() => SafeArea(
              child: _.loader.value
                  ? Container(
                      height: Get.height,
                      width: Get.width,
                      // color: Colors.amber,
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Icon(
                                      Icons.arrow_back_outlined,
                                      size: Get.width * 0.05,
                                      color: Colors.black,
                                    )),
                                Text(
                                  "My Goals",
                                  textAlign: TextAlign.start,
                                  style: UIDataTextStyles.headingtextbold,
                                ).paddingSymmetric(
                                    horizontal: Get.width * 0.015),
                              ],
                            ),
                            Text(
                              "Use this area to view the goals you set for yourself with your business. You may update these any time by clicking 'edit'. These goals are unique to you .This infromation is not send to anyone else and it is not possible for your coach or any of your Accountability Partners to view them. Entering yous goals here provides you with a easy way to measure how well you're doing, as they work with the rest of your HBB system to create reports that help to track the actual impact of your business activities verses the goals you have set",
                              style: TextStyle(
                                  fontSize: Get.width * .0314,
                                  fontWeight: FontWeight.w500),
                            ).marginSymmetric(vertical: Get.height * .02),
                            Text(
                              'Why Are You Building your Business ?',
                              style: TextStyle(
                                  fontSize: Get.width * .033,
                                  fontWeight: FontWeight.bold),
                            ).marginSymmetric(vertical: Get.height * .002),
                            
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            _.goalsText.value
                                ? TextField(
                                    controller: _.notesController,
                                    maxLines:
                                        null, // Allow multiple lines for notes
                                    decoration: InputDecoration(
                                      hintText: 'Enter your notes here...',
                                      border: OutlineInputBorder(),
                                    ),
                                  )
                                : Container(
                                    width: Get.width,
                                    // height: Get.height * .02,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text(
                                      '${_.why}',
                                      style: TextStyle(
                                          fontSize: Get.width * .032,
                                          // color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    )
                                        .marginSymmetric(
                                            vertical: Get.height * .002)
                                        .paddingSymmetric(
                                            horizontal: Get.width * .025,
                                            vertical: Get.height * .01)
                                    // .paddingOnly(bottom: Get.height * .02),
                                    ),
                            Obx(
                              () => Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  _.goalsText.value
                                      ? InkWell(
                                          onTap: () {
                                            _.addGoalText();
                                            _.goalsText.value = false;
                                          },
                                          child: Text(
                                            'save',
                                            style: TextStyle(
                                                fontSize: Get.width * .03,
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      : InkWell(
                                          onTap: () {
                                            _.goalsText.value = true;
                                            _.notesController.text = _.why;
                                          },
                                          child: Text(
                                            'edit',
                                            style: TextStyle(
                                                fontSize: Get.width * .03,
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                ],
                              ),
                            ),

                            // Income
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'What income do you hope to acheive ?',
                                      style: TextStyle(
                                          fontSize: Get.width * .03,
                                          // color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Obx(
                                      () => InkWell(
                                        onTap: () {
                                          _.incomeEdit.value = true;
                                        },
                                        child: _.incomeEdit.value
                                            ? SizedBox()
                                            : Text(
                                                'edit',
                                                style: TextStyle(
                                                    fontSize: Get.width * .03,
                                                    color: Colors.blue,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                      ).marginOnly(left: Get.width * .02),
                                    ),
                                    Obx(
                                      () => InkWell(
                                        onTap: () {
                                          _.addGoalIncome();
                                          // _.incomeEdit.value = false;
                                        },
                                        child: _.incomeEdit.value
                                            ? Text(
                                                'save',
                                                style: TextStyle(
                                                    fontSize: Get.width * .03,
                                                    color: Colors.blue,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            : SizedBox(),
                                      ).marginOnly(left: Get.width * .00),
                                    ),
                                  ],
                                ),
                                Obx(
                                  () => GoalsTextField(
                                    width: Get.width / 4,
                                    controller: _.income30days,
                                    hintText: '',
                                    // hintText: '${_.income1m}',
                                    readonly: _.incomeEdit.value ? false : true,
                                    heading: 'Next 30 days:',
                                    keyboard: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    secondwidth: Get.width / 4,
                                    seccontroller: _.income6months,
                                    sechintText: '',
                                    // sechintText: '${_.income6m}',
                                    secreadonly:
                                        _.incomeEdit.value ? false : true,
                                    secheading: 'Next 6 months:',
                                    seckeyboard: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    thirdwidth: Get.width / 4,
                                    thirdcontroller: _.income1year,
                                    thirdhintText: '',
                                    // thirdhintText: '${_.income1y}',
                                    thirdreadonly:
                                        _.incomeEdit.value ? false : true,
                                    thirdheading: 'Next one year:',
                                    thirdkeyboard: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                  ),
                                ),
                                Container(
                                  width: Get.width,
                                  height: Get.height * .05,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow.shade100,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    border: Border.all(
                                      width: 2,
                                      color: Colors.yellow,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Actual Income: \n\$${_.actualIncome1m}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: Get.width * .025,
                                          // color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Actual Income: \n\$${_.actualIncome6m}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: Get.width * .025,
                                          // color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Actual Income: \n\$${_.actualIncome12m}",
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.fade,
                                        style: TextStyle(
                                          fontSize: Get.width * .025,
                                          // color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ).paddingSymmetric(
                                      horizontal: Get.width * .01),
                                )
                                    .marginSymmetric(vertical: Get.height * .01)
                                    .paddingSymmetric(
                                        horizontal: Get.width * .02),
                                Divider(),
                              ],
                            ),

                            // Hours
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'How Many Hours will you commits ?',
                                      style: TextStyle(
                                          fontSize: Get.width * .03,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Obx(
                                      () => InkWell(
                                        onTap: () {
                                          _.hoursEdit.value = true;
                                        },
                                        child: _.hoursEdit.value
                                            ? SizedBox()
                                            : Text(
                                                'edit',
                                                style: TextStyle(
                                                    fontSize: Get.width * .03,
                                                    color: Colors.blue,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                      ).marginOnly(left: Get.width * .02),
                                    ),
                                    Obx(
                                      () => InkWell(
                                        onTap: () {
                                          _.addGoalHours();
                                          // _.hoursEdit.value = false;
                                        },
                                        child: _.hoursEdit.value
                                            ? Text(
                                                'save',
                                                style: TextStyle(
                                                    fontSize: Get.width * .03,
                                                    color: Colors.blue,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            : SizedBox(),
                                      ).marginOnly(left: Get.width * .00),
                                    ),
                                  ],
                                ),
                                Obx(
                                  () => GoalsTextField(
                                    width: Get.width / 4,
                                    controller: _.hourdays,
                                    hintText: '',
                                    readonly: _.hoursEdit.value ? false : true,
                                    heading: 'Each Days:',
                                    keyboard: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    secondwidth: Get.width / 4,
                                    seccontroller: _.hourweek,
                                    sechintText: '',
                                    secreadonly:
                                        _.hoursEdit.value ? false : true,
                                    secheading: 'Each Week:',
                                    seckeyboard: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    thirdwidth: Get.width / 4,
                                    thirdcontroller: _.hourmonth,
                                    thirdhintText: '',
                                    thirdreadonly:
                                        _.hoursEdit.value ? false : true,
                                    thirdheading: 'Each Month:',
                                    thirdkeyboard: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                  ),
                                ),
                                Container(
                                  width: Get.width,
                                  height: Get.height * .05,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow.shade100,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    border: Border.all(
                                      width: 2,
                                      color: Colors.yellow,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Daily Average : \n\$ 0.61hrs",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: Get.width * .025,
                                          // color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Weekly Average : \n\$ 4.27hrs",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: Get.width * .025,
                                          // color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Monthly Average : \n\$ 18.57hrs",
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.fade,
                                        style: TextStyle(
                                          fontSize: Get.width * .025,
                                          // color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ).paddingSymmetric(
                                      horizontal: Get.width * .01),
                                )
                                    .marginSymmetric(vertical: Get.height * .01)
                                    .paddingSymmetric(
                                        horizontal: Get.width * .02),
                                Divider(),
                              ],
                            ),

                            // Exposures
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'How many exposures do you plan to make ?',
                                      style: TextStyle(
                                          fontSize: Get.width * .03,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Obx(
                                      () => InkWell(
                                        onTap: () {
                                          _.esposureEdit.value = true;
                                        },
                                        child: _.esposureEdit.value
                                            ? SizedBox()
                                            : Text(
                                                'edit',
                                                style: TextStyle(
                                                    fontSize: Get.width * .03,
                                                    color: Colors.blue,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                      ).marginOnly(left: Get.width * .02),
                                    ),
                                    Obx(
                                      () => InkWell(
                                        onTap: () {
                                          _.addGoalExposures();
                                          // _.esposureEdit.value = false;
                                        },
                                        child: _.esposureEdit.value
                                            ? Text(
                                                'save',
                                                style: TextStyle(
                                                    fontSize: Get.width * .03,
                                                    color: Colors.blue,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            : SizedBox(),
                                      ).marginOnly(left: Get.width * .00),
                                    ),
                                  ],
                                ),
                                Obx(
                                  () => GoalsTextField(
                                    width: Get.width / 4,
                                    controller: _.exposureday,
                                    hintText: '',
                                    readonly:
                                        _.esposureEdit.value ? false : true,
                                    heading: 'Each Days:',
                                    keyboard: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    secondwidth: Get.width / 4,
                                    seccontroller: _.exposureweek,
                                    sechintText: '',
                                    secreadonly:
                                        _.esposureEdit.value ? false : true,
                                    secheading: 'Each Week:',
                                    seckeyboard: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    thirdwidth: Get.width / 4,
                                    thirdcontroller: _.exposuremonth,
                                    thirdhintText: '',
                                    thirdreadonly:
                                        _.esposureEdit.value ? false : true,
                                    thirdheading: 'Each Month:',
                                    thirdkeyboard: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                  ),
                                ),
                                Container(
                                  width: Get.width,
                                  height: Get.height * .05,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow.shade100,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    border: Border.all(
                                      width: 2,
                                      color: Colors.yellow,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Daily Average : \n\$ 0.31",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: Get.width * .025,
                                          // color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Weekly Average : \n\$ 2.20",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: Get.width * .025,
                                          // color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Monthly Average : \n\$ 9.57",
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.fade,
                                        style: TextStyle(
                                          fontSize: Get.width * .025,
                                          // color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ).paddingSymmetric(
                                      horizontal: Get.width * .01),
                                )
                                    .marginSymmetric(vertical: Get.height * .01)
                                    .paddingSymmetric(
                                        horizontal: Get.width * .02),
                                Divider(),
                              ],
                            ),

                            // Customers
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'How many customers do you plan on acquiring ?',
                                      style: TextStyle(
                                          fontSize: Get.width * .03,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Obx(
                                      () => InkWell(
                                        onTap: () {
                                          _.customersEdit.value = true;
                                        },
                                        child: _.customersEdit.value
                                            ? SizedBox()
                                            : Text(
                                                'edit',
                                                style: TextStyle(
                                                    fontSize: Get.width * .03,
                                                    color: Colors.blue,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                      ).marginOnly(left: Get.width * .02),
                                    ),
                                    Obx(
                                      () => InkWell(
                                        onTap: () {
                                          _.addGoalCustomers();
                                          // _.customersEdit.value = false;
                                        },
                                        child: _.customersEdit.value
                                            ? Text(
                                                'save',
                                                style: TextStyle(
                                                    fontSize: Get.width * .03,
                                                    color: Colors.blue,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            : SizedBox(),
                                      ).marginOnly(left: Get.width * .00),
                                    ),
                                  ],
                                ),
                                Obx(
                                  () => GoalsTextField(
                                    width: Get.width / 4,
                                    controller: _.customerweek,
                                    hintText: '',
                                    readonly:
                                        _.customersEdit.value ? false : true,
                                    heading: 'Each Days:',
                                    keyboard: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    secondwidth: Get.width / 4,
                                    seccontroller: _.customermonth,
                                    sechintText: '',
                                    secreadonly:
                                        _.customersEdit.value ? false : true,
                                    secheading: 'Each Week:',
                                    seckeyboard: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                  ),
                                ),
                                Container(
                                  width: Get.width,
                                  height: Get.height * .05,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow.shade100,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    border: Border.all(
                                      width: 2,
                                      color: Colors.yellow,
                                    ),
                                  ),
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Weekly Average : \n\$ 0.31",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: Get.width * .025,
                                          // color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ).marginOnly(right: Get.width * 0.2),
                                      Text(
                                        "Monthly Average : \n\$ 9.57",
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.fade,
                                        style: TextStyle(
                                          fontSize: Get.width * .025,
                                          // color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ).paddingSymmetric(
                                      horizontal: Get.width * .01),
                                )
                                    .marginSymmetric(vertical: Get.height * .01)
                                    .paddingSymmetric(
                                        horizontal: Get.width * .02),
                                Divider(),
                              ],
                            ),

                            // Sponsor
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'How many Distributor do you plan to sponsor ?',
                                      style: TextStyle(
                                          fontSize: Get.width * .03,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Obx(
                                      () => InkWell(
                                        onTap: () {
                                          _.sponsorEdit.value = true;
                                        },
                                        child: _.sponsorEdit.value
                                            ? SizedBox()
                                            : Text(
                                                'edit',
                                                style: TextStyle(
                                                    fontSize: Get.width * .03,
                                                    color: Colors.blue,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                      ).marginOnly(left: Get.width * .02),
                                    ),
                                    Obx(
                                      () => InkWell(
                                        onTap: () {
                                          _.addGoalSponsors();
                                          // _.sponsorEdit.value = false;
                                        },
                                        child: _.sponsorEdit.value
                                            ? Text(
                                                'save',
                                                style: TextStyle(
                                                    fontSize: Get.width * .03,
                                                    color: Colors.blue,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            : SizedBox(),
                                      ).marginOnly(left: Get.width * .00),
                                    ),
                                  ],
                                ),
                                Obx(
                                  () => GoalsTextField(
                                    width: Get.width / 4,
                                    controller: _.sponsorsweek,
                                    hintText: '',
                                    readonly:
                                        _.sponsorEdit.value ? false : true,
                                    heading: 'Each Week:',
                                    keyboard: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    secondwidth: Get.width / 4,
                                    seccontroller: _.sponsorsmonth,
                                    sechintText: '',
                                    secreadonly:
                                        _.sponsorEdit.value ? false : true,
                                    secheading: 'Each Month:',
                                    seckeyboard: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                  ),
                                ),
                                Container(
                                  width: Get.width,
                                  height: Get.height * .05,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow.shade100,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    border: Border.all(
                                      width: 2,
                                      color: Colors.yellow,
                                    ),
                                  ),
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Weekly Average : \n\$ 0.31",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: Get.width * .025,
                                          // color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ).marginOnly(right: Get.width * 0.2),
                                      Text(
                                        "Monthly Average : \n\$ 9.57",
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.fade,
                                        style: TextStyle(
                                          fontSize: Get.width * .025,
                                          // color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ).paddingSymmetric(
                                      horizontal: Get.width * .01),
                                )
                                    .marginSymmetric(vertical: Get.height * .01)
                                    .paddingSymmetric(
                                        horizontal: Get.width * .02),
                                Divider(),
                              ],
                            ),

                            // Position 1
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'When will you acheive the following position ?',
                                      style: TextStyle(
                                          fontSize: Get.width * .03,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ).paddingOnly(bottom: 10),
                                Obx(
                                  () => GoalsTextField(
                                    width: Get.width / 1.15,
                                    controller: _.rankpos1,
                                    hintText: '${_.posName1}',
                                    readonly: _.pos1Edit.value ? false : true,
                                    heading: '${_.rankPos1}',
                                  ),
                                ),
                                Row(
                                  children: [
                                    Obx(
                                      () => InkWell(
                                        onTap: () {
                                          _.pos1Edit.value = true;
                                        },
                                        child: _.pos1Edit.value
                                            ? SizedBox()
                                            : Text(
                                                'edit',
                                                style: TextStyle(
                                                    fontSize: Get.width * .03,
                                                    color: Colors.blue,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                      ).marginOnly(left: Get.width * .02),
                                    ),
                                    Obx(
                                      () => InkWell(
                                        onTap: () {
                                          _.pos1Edit.value = false;
                                        },
                                        child: _.pos1Edit.value
                                            ? Text(
                                                'save',
                                                style: TextStyle(
                                                    fontSize: Get.width * .03,
                                                    color: Colors.blue,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            : SizedBox(),
                                      ).marginOnly(left: Get.width * .00),
                                    ),
                                  ],
                                ).paddingOnly(bottom: 10)
                              ],
                            ),

                            // Position 2
                            Column(
                              children: [
                                Obx(
                                  () => GoalsTextField(
                                    width: Get.width / 1.15,
                                    controller: _.rankpos2,
                                    hintText: '${_.posName2}',
                                    readonly: _.pos2Edit.value ? false : true,
                                    heading: '${_.rankPos2}',
                                  ),
                                ),
                                Row(
                                  children: [
                                    Obx(
                                      () => InkWell(
                                        onTap: () {
                                          _.pos2Edit.value = true;
                                        },
                                        child: _.pos2Edit.value
                                            ? SizedBox()
                                            : Text(
                                                'edit',
                                                style: TextStyle(
                                                    fontSize: Get.width * .03,
                                                    color: Colors.blue,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                      ).marginOnly(left: Get.width * .02),
                                    ),
                                    Obx(
                                      () => InkWell(
                                        onTap: () {
                                          _.pos2Edit.value = false;
                                        },
                                        child: _.pos2Edit.value
                                            ? Text(
                                                'save',
                                                style: TextStyle(
                                                    fontSize: Get.width * .03,
                                                    color: Colors.blue,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            : SizedBox(),
                                      ).marginOnly(left: Get.width * .00),
                                    ),
                                  ],
                                ).paddingOnly(bottom: 10),
                              ],
                            ),

                            // Position 3
                            Column(
                              children: [
                                Obx(
                                  () => GoalsTextField(
                                    width: Get.width / 1.15,
                                    controller: _.rankpos3,
                                    hintText: '${_.posName3}',
                                    readonly: _.pos3Edit.value ? false : true,
                                    heading: '${_.rankPos3}',
                                  ),
                                ),
                                Row(
                                  children: [
                                    Obx(
                                      () => InkWell(
                                        onTap: () {
                                          _.pos3Edit.value = true;
                                        },
                                        child: _.pos3Edit.value
                                            ? SizedBox()
                                            : Text(
                                                'edit',
                                                style: TextStyle(
                                                    fontSize: Get.width * .03,
                                                    color: Colors.blue,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                      ).marginOnly(left: Get.width * .02),
                                    ),
                                    Obx(
                                      () => InkWell(
                                        onTap: () {
                                          _.pos3Edit.value = false;
                                        },
                                        child: _.pos3Edit.value
                                            ? Text(
                                                'save',
                                                style: TextStyle(
                                                    fontSize: Get.width * .03,
                                                    color: Colors.blue,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            : SizedBox(),
                                      ).marginOnly(left: Get.width * .00),
                                    ),
                                  ],
                                ).paddingOnly(bottom: 10),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: Get.width / 1 / 4,
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Text(
                                      'Close',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: Get.width * .035),
                                    ),
                                  ),
                                ).marginSymmetric(vertical: Get.height * .01),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    )))
          .paddingSymmetric(vertical: Get.height * 0.01)
          .marginSymmetric(horizontal: Get.height * 0.02),
    );
  }
}
