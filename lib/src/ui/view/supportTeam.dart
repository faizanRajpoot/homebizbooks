// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hbb/src/utils/uidata/color.dart';
import 'package:hbb/src/utils/uidata/text_styles.dart';

import '../../controllers/SupportTeamController.dart';

class SupportTeamScreen extends StatelessWidget {
  final SupportTeamController _ = Get.put(SupportTeamController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      // ),
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
                    "My Support Team",
                    textAlign: TextAlign.start,
                    style: UIDataTextStyles.headingtextbold,
                  ).paddingSymmetric(horizontal: Get.width * 0.015),
                ],
              ).marginSymmetric(vertical: Get.height * .02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Stack(
                        children: [
                          // Container with content
                          Container(
                            width: Get.width / 2.25,
                            height: Get.height * .03,
                            decoration: BoxDecoration(
                                color: UIDataColors.greyColor,
                                border: Border.all(
                                  width: 1,
                                  color: Colors.grey,
                                )),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Rank upto Position no. 1',
                                  style: TextStyle(
                                    fontSize: Get.width * .019,
                                    color: Colors.black,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.defaultDialog(
                                      title: 'Edit Name',
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () async {},
                                          child: Text('Edit'),
                                        ),
                                      ],
                                    );
                                  },
                                  child: SizedBox(
                                    height: Get.height * .08,
                                    child: Row(
                                      children: [
                                        Text(
                                          'Edit',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: Get.width * .020,
                                            color: Colors.red,
                                          ),
                                        ).marginSymmetric(
                                            horizontal: Get.width * .02),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ).paddingSymmetric(horizontal: Get.width * .01),
                          ),
                          // Inner shadow
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: Get.width,
                              height: Get.height * .002,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 10,
                                    blurRadius: 5,
                                    offset: Offset(10, 10),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      //
                      Stack(
                        children: [
                          // Container with content
                          Container(
                            width: Get.width / 2.25,
                            height: Get.height * .06,
                            decoration: BoxDecoration(
                                color: UIDataColors.greyColor,
                                border: Border.all(
                                  width: 1,
                                  color: Colors.grey,
                                )),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Name :',
                                  style: TextStyle(
                                    fontSize: Get.width * .035,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Bill',
                                  style: TextStyle(
                                    fontSize: Get.width * .035,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ).marginSymmetric(horizontal: Get.width * .01),
                              ],
                            ).paddingSymmetric(horizontal: Get.width * .01),
                          ),
                          // Inner shadow
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: Get.width,
                              height: Get.height * .002,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 10,
                                    blurRadius: 5,
                                    offset: Offset(10, 10),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      //
                    ],
                  ),
                  Column(
                    children: [
                      Stack(
                        children: [
                          // Container with content
                          Container(
                            width: Get.width / 2.25,
                            height: Get.height * .03,
                            decoration: BoxDecoration(
                                color: UIDataColors.greyColor,
                                border: Border.all(
                                  width: 1,
                                  color: Colors.grey,
                                )),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Rank upto Position no. 2',
                                  style: TextStyle(
                                    fontSize: Get.width * .019,
                                    color: Colors.black,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.defaultDialog(
                                      title: 'Edit Name',
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () async {},
                                          child: Text('Edit'),
                                        ),
                                      ],
                                    );
                                  },
                                  child: SizedBox(
                                    height: Get.height * .08,
                                    child: Row(
                                      children: [
                                        Text(
                                          'Edit',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: Get.width * .020,
                                            color: Colors.red,
                                          ),
                                        ).marginSymmetric(
                                            horizontal: Get.width * .02),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ).paddingSymmetric(horizontal: Get.width * .01),
                          ),
                          // Inner shadow
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: Get.width,
                              height: Get.height * .002,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 10,
                                    blurRadius: 5,
                                    offset: Offset(10, 10),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      //
                      Stack(
                        children: [
                          // Container with content
                          Container(
                            width: Get.width / 2.25,
                            height: Get.height * .06,
                            decoration: BoxDecoration(
                                color: UIDataColors.greyColor,
                                border: Border.all(
                                  width: 1,
                                  color: Colors.grey,
                                )),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Name :',
                                  style: TextStyle(
                                    fontSize: Get.width * .035,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Jorrick',
                                  style: TextStyle(
                                    fontSize: Get.width * .035,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ).marginSymmetric(horizontal: Get.width * .01),
                              ],
                            ).paddingSymmetric(horizontal: Get.width * .01),
                          ),
                          // Inner shadow
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: Get.width,
                              height: Get.height * .002,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 10,
                                    blurRadius: 5,
                                    offset: Offset(10, 10),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),

              //

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Stack(
                        children: [
                          // Container with content
                          Container(
                            width: Get.width / 2.25,
                            height: Get.height * .03,
                            decoration: BoxDecoration(
                                color: UIDataColors.greyColor,
                                border: Border.all(
                                  width: 1,
                                  color: Colors.grey,
                                )),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Rank upto Position no. 3',
                                  style: TextStyle(
                                    fontSize: Get.width * .019,
                                    color: Colors.black,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.defaultDialog(
                                      title: 'Edit Name',
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () async {},
                                          child: Text('Edit'),
                                        ),
                                      ],
                                    );
                                  },
                                  child: SizedBox(
                                    height: Get.height * .08,
                                    child: Row(
                                      children: [
                                        Text(
                                          'Edit',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: Get.width * .020,
                                            color: Colors.red,
                                          ),
                                        ).marginSymmetric(
                                            horizontal: Get.width * .02),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ).paddingSymmetric(horizontal: Get.width * .01),
                          ),
                          // Inner shadow
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: Get.width,
                              height: Get.height * .002,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 10,
                                    blurRadius: 5,
                                    offset: Offset(10, 10),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      //
                      Stack(
                        children: [
                          // Container with content
                          Container(
                            width: Get.width / 2.25,
                            height: Get.height * .06,
                            decoration: BoxDecoration(
                                color: UIDataColors.greyColor,
                                border: Border.all(
                                  width: 1,
                                  color: Colors.grey,
                                )),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Name :',
                                  style: TextStyle(
                                    fontSize: Get.width * .035,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Joe',
                                  style: TextStyle(
                                    fontSize: Get.width * .035,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ).marginSymmetric(horizontal: Get.width * .01),
                              ],
                            ).paddingSymmetric(horizontal: Get.width * .01),
                          ),
                          // Inner shadow
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: Get.width,
                              height: Get.height * .002,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 10,
                                    blurRadius: 5,
                                    offset: Offset(10, 10),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      //
                    ],
                  ),
                  Column(
                    children: [
                      Stack(
                        children: [
                          // Container with content
                          Container(
                            width: Get.width / 2.25,
                            height: Get.height * .03,
                            decoration: BoxDecoration(
                                color: UIDataColors.greyColor,
                                border: Border.all(
                                  width: 1,
                                  color: Colors.grey,
                                )),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Rank upto Position no. 4',
                                  style: TextStyle(
                                    fontSize: Get.width * .019,
                                    color: Colors.black,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.defaultDialog(
                                      title: 'Edit Name',
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () async {},
                                          child: Text('Edit'),
                                        ),
                                      ],
                                    );
                                  },
                                  child: SizedBox(
                                    height: Get.height * .08,
                                    child: Row(
                                      children: [
                                        Text(
                                          'Edit',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: Get.width * .020,
                                            color: Colors.red,
                                          ),
                                        ).marginSymmetric(
                                            horizontal: Get.width * .02),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ).paddingSymmetric(horizontal: Get.width * .01),
                          ),
                          // Inner shadow
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: Get.width,
                              height: Get.height * .002,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 10,
                                    blurRadius: 5,
                                    offset: Offset(10, 10),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      //
                      Stack(
                        children: [
                          // Container with content
                          Container(
                            width: Get.width / 2.25,
                            height: Get.height * .06,
                            decoration: BoxDecoration(
                                color: UIDataColors.greyColor,
                                border: Border.all(
                                  width: 1,
                                  color: Colors.grey,
                                )),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Name :',
                                  style: TextStyle(
                                    fontSize: Get.width * .035,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Patty',
                                  style: TextStyle(
                                    fontSize: Get.width * .035,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ).marginSymmetric(horizontal: Get.width * .01),
                              ],
                            ).paddingSymmetric(horizontal: Get.width * .01),
                          ),
                          // Inner shadow
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: Get.width,
                              height: Get.height * .002,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 10,
                                    blurRadius: 5,
                                    offset: Offset(10, 10),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ).marginSymmetric(vertical: Get.height * .012),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: UIDataColors.greyColor,
                        border: Border.all(
                          color: Color.fromARGB(102, 158, 158, 158),
                          width: 1.0,
                        ),
                      ),
                      child: Text(
                        'Close',
                        style: UIDataTextStyles.commontext,
                      ).paddingAll(Get.width * .02),
                    ),
                  ),
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
