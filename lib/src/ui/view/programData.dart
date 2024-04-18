// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hbb/src/controllers/programDataController.dart';
import 'package:hbb/src/utils/routes/routes.dart';
import 'package:hbb/src/utils/uidata/text_styles.dart';

class ProgramDataScreen extends StatelessWidget {
  final ProgramDataController _ = Get.put(ProgramDataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          // color: Colors.amber,
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
                    "My Program Data",
                    textAlign: TextAlign.start,
                    style: UIDataTextStyles.headingtextbold,
                  ).paddingSymmetric(horizontal: Get.width * 0.015),
                ],
              ).marginSymmetric(vertical: Get.height * .01),
              Text(
                "Check and update your Program Goals, your Support Team and your Contact List. You Can Even initiate a Daily Exposure to someone on your Contacts List:",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: Get.width * .032, fontWeight: FontWeight.w500),
              ).marginSymmetric(vertical: Get.height * .02),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.contactlist);
                },
                child: Text(
                  "\u2022 My Contact List ",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: Get.width * .035,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.coachnetwork);
                },
                child: Text(
                  "\u2022 My Coaching Network",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: Get.width * .035,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                ).marginSymmetric(vertical: Get.height * .01),
              ),
              InkWell(
                  onTap: () {
                    // if (goalsController.loader.value == true) {
                    // }
                    Get.toNamed(Routes.mygoals);
                  },
                  child:
                      //  goalsController.loader.value ?
                      Text(
                    "\u2022 My Goals ",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: Get.width * .035,
                      fontWeight: FontWeight.w500,
                      color: Colors.red,
                    ),
                  )
                  // : CircularProgressIndicator(),
                  ),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.incomeexpense);
                },
                child: Text(
                  "\u2022 My Incomes and Expenses",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: Get.width * .035,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                ).marginSymmetric(vertical: Get.height * .01),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.supportteam);
                },
                child: Text(
                  "\u2022 My Support Team",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: Get.width * .035,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                ),
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
                            color: Colors.red, fontSize: Get.width * .035),
                      ),
                    ),
                  ).marginSymmetric(vertical: Get.height * .04),
                ],
              ),
            ],
          ),
        ),
      )
          .paddingSymmetric(vertical: Get.height * 0.01)
          .marginSymmetric(horizontal: Get.height * 0.02),
    );
  }
}
