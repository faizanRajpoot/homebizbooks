// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hbb/src/controllers/programDetailController.dart';
import 'package:hbb/src/utils/uidata/color.dart';
import 'package:hbb/src/utils/uidata/text_styles.dart';

class ProgramDetailScreen extends StatelessWidget {
  final ProgramDetailController _ = Get.put(ProgramDetailController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        //    appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        // ),
        body: _.loader.value
            ? SafeArea(
                child: SingleChildScrollView(
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
                              "Program Details",
                              textAlign: TextAlign.start,
                              style: UIDataTextStyles.headingtextbold,
                            ).paddingSymmetric(horizontal: Get.width * 0.015),
                          ],
                        ).marginSymmetric(vertical: Get.height * .02),
                        Divider(
                          color: Colors.grey,
                        ).marginSymmetric(vertical: Get.height * .015),
                        //
                        Container(
                          color: UIDataColors.greyColor,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  // color: Colors.red,
                                  width: Get.width / 1 / 4,
                                  child: Text("Member Since",
                                      style: UIDataTextStyles.commontext),
                                ),
                                SizedBox(
                                  width: Get.width / 1 / 3,
                                  child: Text("November 11th, 2019 ",
                                      textAlign: TextAlign.center,
                                      style: UIDataTextStyles.commontext),
                                ),
                                SizedBox(
                                  width: Get.width / 1 / 4,
                                  child: GestureDetector(
                                    onTap: () {
                                      print("ok");
                                    },
                                    child: Text(
                                      'edit',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: Get.width * .027),
                                    ),
                                  ),
                                ),
                              ]).paddingSymmetric(
                              vertical: Get.height * .025,
                              horizontal: Get.width * .01),
                        ),
                        //
                        Container(
                          child: Row(children: [
                            SizedBox(
                              width: Get.width / 1 / 2,
                              child: Text(
                                "Coach Details:",
                                style: TextStyle(
                                    fontSize: Get.width * .03,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ]).paddingSymmetric(
                              horizontal: Get.width * .015,
                              vertical: Get.height * .015),
                        ),
                        //
                        Container(
                          color: UIDataColors.greyColor,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  // color: Colors.red,
                                  width: Get.width / 1 / 4,
                                  child: Text("Working With:",
                                      style: UIDataTextStyles.commontext),
                                ),
                                SizedBox(
                                  width: Get.width / 1 / 3,
                                  child: Text("Jorrick Battle(JB1344) ",
                                      textAlign: TextAlign.center,
                                      style: UIDataTextStyles.commontext),
                                ),
                                SizedBox(
                                  width: Get.width / 1 / 4,
                                  child: GestureDetector(
                                    onTap: () {
                                      print("ok");
                                    },
                                    child: Text(
                                      'edit',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: Get.width * .027),
                                    ),
                                  ),
                                ),
                              ]).paddingSymmetric(
                              vertical: Get.height * .025,
                              horizontal: Get.width * .01),
                        ),
                        //
                        Container(
                          child: Row(children: [
                            SizedBox(
                              child: Text(
                                "Accountability Partner Details:",
                                style: TextStyle(
                                    fontSize: Get.width * .03,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ]).paddingSymmetric(
                              horizontal: Get.width * .015,
                              vertical: Get.height * .015),
                        ),

                        //
                        Container(
                          color: UIDataColors.greyColor,
                          height: Get.height / 3,
                          child: ListView.builder(
                              itemCount: _.data.length,
                              itemBuilder: (context, index) {
                                return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        // color: Colors.red,
                                        width: Get.width / 1 / 4,
                                        child: Text("Partners:",
                                            style: UIDataTextStyles.commontext),
                                      ),
                                      SizedBox(
                                        width: Get.width / 1 / 3,
                                        child: Text(
                                            "${_.data[index]['displayname']} (${_.data[index]['memberCode']})",
                                            // textAlign: TextAlign.center,
                                            style: UIDataTextStyles.commontext),
                                      ),
                                      SizedBox(
                                        width: Get.width / 1 / 4,
                                        child: GestureDetector(
                                          onTap: () {
                                            print("ok");
                                          },
                                          child: Text(
                                            'edit',
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: Get.width * .027),
                                          ),
                                        ),
                                      ),
                                    ]).paddingSymmetric(
                                    vertical: Get.height * .01,
                                    horizontal: Get.width * .01);
                              }),
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
                            ).marginSymmetric(vertical: Get.height * .04),
                          ],
                        ),
                        Spacer(),
                        Text(
                          'Remember, you will not be able to view your Accountability Partners’ calendars, nor will they be able to view yours, until they grant you access',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: Get.width * .021),
                        )
                      ],
                    ),
                  ),
                ),
              )
                .paddingSymmetric(vertical: Get.height * 0.01)
                .marginSymmetric(horizontal: Get.height * 0.03)
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
