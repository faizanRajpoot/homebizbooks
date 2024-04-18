import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hbb/src/controllers/conferenceCallController.dart';
import 'package:hbb/src/ui/widgets/commonClasses.dart';

import '../../utils/uidata/color.dart';

class ConferenceCallScreen extends StatelessWidget {
  final ConferenceCallController _ = Get.put(ConferenceCallController());

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
                          'Conference Call. ${_.formattedDate}',
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
                      controller: _.timeofcall,
                      hintText: '',
                      readonly: false,
                      heading: "Time Of Call:",
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
                            "Notes:",
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

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
  _.expCheck=true;
                        
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
                    ),
                  ],
                ),
              ),
            ).marginSymmetric(horizontal: Get.width * 0.02),
          )),
    );
  }
}

//
