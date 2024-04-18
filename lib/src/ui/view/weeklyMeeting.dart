import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hbb/src/ui/widgets/commonClasses.dart';
import 'package:hbb/src/utils/uidata/color.dart';

import '../../controllers/weeklyMeetingController.dart';

class WeeklyMeetingScreen extends StatelessWidget {
  final WeeklyMeetingController _ = Get.put(WeeklyMeetingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      // ),
      body: Container(
          color: Colors.white,
          child: SafeArea(
            child: Container(
              height: Get.height,
              width: Get.width,
              // color: Colors.red,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.arrow_back_outlined,
                              size: Get.width * 0.04,
                              color: Colors.black,
                            )),
                        Text(
                          'Weekly Meeting. ${_.formattedDate}',
                          style: TextStyle(
                              color: Colors.grey, fontSize: Get.width * .03),
                        ).paddingSymmetric(horizontal: Get.width * 0.015),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Text(
                            'Close',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: Colors.red, fontSize: Get.width * .03),
                          ),
                        )
                      ],
                    ).marginSymmetric(
                        vertical: Get.height * .02,
                        horizontal: Get.width * 0.02),

                    GoalsTextField(
                      width: Get.width / 1.09,
                      controller: _.meetingLocation,
                      hintText: '',
                      readonly: false,
                      heading: "Meeting Location:",
                    ),
                    //
                    SizedBox(
                      height: Get.height * .01,
                    ),
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Parties Present / Notes:",
                            style: TextStyle(
                                fontSize: Get.width * .025,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            child: TextField(
                              controller: _.notes,
                              maxLines: 5,
                              style: TextStyle(
                                fontSize: Get.width * .025,
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: Get.height * .005,
                                ),
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: Colors.black),
                                // hintText: hintText,
                              ),
                            ).paddingSymmetric(horizontal: Get.width * .01),
                          )
                        ],
                      ),
                    ).paddingSymmetric(horizontal: Get.width * .02),
                    //
                    SizedBox(
                      height: Get.height * .01,
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Type Of Meeting:",
                          style: TextStyle(
                              fontSize: Get.width * .04,
                              fontWeight: FontWeight.bold),
                        ),
                        Obx(() => Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: Get.height * .035,
                                  // width: Get.width ,
                                  child: RadioListTile<String>(
                                    title: Text(
                                      'Executive Luncheon/Dinner',
                                      style: TextStyle(
                                          fontSize: Get.width * .03,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    value: 'Executive Luncheon/Dinner',
                                    groupValue: _.selectedOption.value,
                                    onChanged: (value) =>
                                        _.setSelectedOption(value!),
                                  ),
                                ),
                                //
                                SizedBox(
                                  height: Get.height * .01,
                                ),
                                SizedBox(
                                  height: Get.height * .035,
                                  // width: Get.width ,
                                  child: RadioListTile<String>(
                                    title: Text(
                                      'Home Meeting/Party (PBR)',
                                      style: TextStyle(
                                          fontSize: Get.width * .03,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    value: 'Home Meeting/Party (PBR)',
                                    groupValue: _.selectedOption.value,
                                    onChanged: (value) =>
                                        _.setSelectedOption(value!),
                                  ),
                                ),
                                //
                                SizedBox(
                                  height: Get.height * .01,
                                ),
                                SizedBox(
                                  height: Get.height * .035,
                                  // width: Get.width ,
                                  child: RadioListTile<String>(
                                    title: Text(
                                      'International Event',
                                      style: TextStyle(
                                          fontSize: Get.width * .03,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    value: 'International Event',
                                    groupValue: _.selectedOption.value,
                                    onChanged: (value) =>
                                        _.setSelectedOption(value!),
                                  ),
                                ),
                                //
                                SizedBox(
                                  height: Get.height * .01,
                                ),
                                SizedBox(
                                  height: Get.height * .035,
                                  // width: Get.width ,
                                  child: RadioListTile<String>(
                                    title: Text(
                                      'Leadership Training',
                                      style: TextStyle(
                                          fontSize: Get.width * .03,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    value: 'Leadership Training',
                                    groupValue: _.selectedOption.value,
                                    onChanged: (value) =>
                                        _.setSelectedOption(value!),
                                  ),
                                ),
                                //
                                SizedBox(
                                  height: Get.height * .01,
                                ),
                                SizedBox(
                                  height: Get.height * .035,
                                  // width: Get.width ,
                                  child: RadioListTile<String>(
                                    title: Text(
                                      'Local Event',
                                      style: TextStyle(
                                          fontSize: Get.width * .03,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    value: 'Local Event',
                                    groupValue: _.selectedOption.value,
                                    onChanged: (value) =>
                                        _.setSelectedOption(value!),
                                  ),
                                ),
                                //
                                SizedBox(
                                  height: Get.height * .01,
                                ),
                                SizedBox(
                                  height: Get.height * .035,
                                  // width: Get.width ,
                                  child: RadioListTile<String>(
                                    title: Text(
                                      'National Event',
                                      style: TextStyle(
                                          fontSize: Get.width * .03,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    value: 'National Event',
                                    groupValue: _.selectedOption.value,
                                    onChanged: (value) =>
                                        _.setSelectedOption(value!),
                                  ),
                                ),
                                //
                                SizedBox(
                                  height: Get.height * .01,
                                ),
                                SizedBox(
                                  height: Get.height * .035,
                                  // width: Get.width ,
                                  child: RadioListTile<String>(
                                    title: Text(
                                      'Online Meeting/Webinar',
                                      style: TextStyle(
                                          fontSize: Get.width * .03,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    value: 'Online Meeting/Webinar',
                                    groupValue: _.selectedOption.value,
                                    onChanged: (value) =>
                                        _.setSelectedOption(value!),
                                  ),
                                ),
                                //
                                SizedBox(
                                  height: Get.height * .01,
                                ),
                                SizedBox(
                                  height: Get.height * .035,
                                  // width: Get.width ,
                                  child: RadioListTile<String>(
                                    title: Text(
                                      'Regional Event',
                                      style: TextStyle(
                                          fontSize: Get.width * .03,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    value: 'Regional Event',
                                    groupValue: _.selectedOption.value,
                                    onChanged: (value) =>
                                        _.setSelectedOption(value!),
                                  ),
                                ),
                                //
                                SizedBox(
                                  height: Get.height * .01,
                                ),
                                SizedBox(
                                  height: Get.height * .035,
                                  // width: Get.width ,
                                  child: RadioListTile<String>(
                                    title: Text(
                                      'Team/System Training',
                                      style: TextStyle(
                                          fontSize: Get.width * .03,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    value: 'Team/System Training',
                                    groupValue: _.selectedOption.value,
                                    onChanged: (value) =>
                                        _.setSelectedOption(value!),
                                  ),
                                ),
                                //
                                SizedBox(
                                  height: Get.height * .01,
                                ),
                                SizedBox(
                                  height: Get.height * .035,
                                  // width: Get.width ,
                                  child: RadioListTile<String>(
                                    title: Text(
                                      'Weekly Business Briefing',
                                      style: TextStyle(
                                          fontSize: Get.width * .03,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    value: 'Weekly Business Briefing',
                                    groupValue: _.selectedOption.value,
                                    onChanged: (value) =>
                                        _.setSelectedOption(value!),
                                  ),
                                ),
                                //
                                SizedBox(
                                  height: Get.height * .01,
                                ),
                                SizedBox(
                                  height: Get.height * .035,
                                  // width: Get.width ,
                                  child: RadioListTile<String>(
                                    title: Text(
                                      'Other',
                                      style: TextStyle(
                                          fontSize: Get.width * .03,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    value: 'Other',
                                    groupValue: _.selectedOption.value,
                                    onChanged: (value) =>
                                        _.setSelectedOption(value!),
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(
                          height: Get.height * .04,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                _.expCheck = true;
                           
                                _.submit();
                              },
                              child: Container(
                                color: Colors.grey,
                                child: Text(
                                  'Expense',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Get.width * 0.035),
                                ).marginSymmetric(
                                    horizontal: Get.width * 0.04,
                                    vertical: Get.height * 0.01),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                _.submit();
                              },
                              child: Container(
                                color: UIDataColors.commonColor,
                                child: Text(
                                  '${_.check}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Get.width * 0.035),
                                ).marginSymmetric(
                                    horizontal: Get.width * 0.04,
                                    vertical: Get.height * 0.01),
                              ).paddingSymmetric(horizontal: 10),
                            ),
                          ],
                        )
                      ],
                    ).paddingSymmetric(horizontal: Get.width * .02),
                  ],
                ),
              ),
            ).marginSymmetric(horizontal: Get.width * 0.02),
          )),
    );
  }
}

//
