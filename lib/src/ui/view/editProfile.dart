// ignore_for_file: must_be_immutable, unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hbb/src/controllers/profileController.dart';
import 'package:hbb/src/utils/uidata/color.dart';
import 'package:hbb/src/utils/uidata/text_styles.dart';

class EditProfileScreen extends StatelessWidget {
  final ProfileController _ = Get.put(ProfileController());
  GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          // color: Colors.amber,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "${box.read('uname')}",
                  style: TextStyle(
                      fontSize: Get.width * .08, fontWeight: FontWeight.bold),
                ).marginOnly(top: Get.height * .02),
                Divider(
                  color: Colors.black,
                ).marginOnly(top: Get.height * .02),
                Container(
                  width: Get.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Personal Details",
                        // textAlign: TextAlign.start,
                        style: UIDataTextStyles.headingtextbold,
                      ).marginSymmetric(vertical: Get.height * .01),
                      Divider(),
                      //
                      Container(
                        color: UIDataColors.greyColor,
                        child: Row(children: [
                          Container(
                            // color: Colors.red,
                            width: Get.width / 1 / 4,
                            child: Text("Name:",
                                style: UIDataTextStyles.commontext),
                          ),
                          SizedBox(
                            width: Get.width / 1 / 3,
                            child: Text("${box.read('ufullName')}",
                                textAlign: TextAlign.start,
                                style: UIDataTextStyles.commontext),
                          ),
                          SizedBox(
                            width: Get.width / 1 / 4,
                            child: GestureDetector(
                              onTap: () {
                                // print("ok");
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
                            vertical: Get.height * .015,
                            horizontal: Get.width * .01),
                      ),
                      //
                      Container(
                        decoration: BoxDecoration(
                          border: Border.symmetric(
                              horizontal: BorderSide(
                            color: Color.fromARGB(102, 158, 158, 158),
                            width: 1.0,
                          )),
                        ),
                        child: Row(children: [
                          SizedBox(
                            width: Get.width / 1 / 4,
                            child: Text(
                              "My Unique ID:",
                              style: UIDataTextStyles.commontext,
                            ),
                          ),
                          SizedBox(
                            width: Get.width / 1 / 3,
                            child: Text(
                              "${box.read('uId')}",
                              textAlign: TextAlign.start,
                              style: UIDataTextStyles.commontext,
                            ),
                          ),
                          SizedBox(
                            width: Get.width / 1 / 4,
                          ),
                        ]).paddingSymmetric(
                            horizontal: Get.width * .01,
                            vertical: Get.height * .015),
                      ),
                      //
                      Container(
                        color: UIDataColors.greyColor,
                        child: Row(children: [
                          Container(
                            // color: Colors.red,
                            width: Get.width / 1 / 4,
                            child: Text("Address:",
                                style: UIDataTextStyles.commontext),
                          ),
                          SizedBox(
                            width: Get.width / 1 / 3,
                            child: Text("${box.read('uAddress')}",
                                textAlign: TextAlign.start,
                                style: UIDataTextStyles.commontext),
                          ),
                          SizedBox(
                            width: Get.width / 1 / 4,
                            child: GestureDetector(
                              onTap: () {
                                // print("ok");
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
                            vertical: Get.height * .015,
                            horizontal: Get.width * .01),
                      ),
                      //
                      Container(
                        decoration: BoxDecoration(
                          border: Border.symmetric(
                              horizontal: BorderSide(
                            color: Color.fromARGB(102, 158, 158, 158),
                            width: 1.0,
                          )),
                        ),
                        child: Row(children: [
                          Container(
                            width: Get.width / 1 / 4,
                            child: Text(
                              "Email:",
                              style: UIDataTextStyles.commontext,
                            ),
                          ),
                          SizedBox(
                            width: Get.width / 1 / 3,
                            child: Text(
                              "${box.read('uEmail')}",
                              textAlign: TextAlign.start,
                              style: UIDataTextStyles.commontext,
                            ),
                          ),
                          SizedBox(
                            width: Get.width / 1 / 4,
                            child: GestureDetector(
                              onTap: () {
                                // print("ok");
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
                            horizontal: Get.width * .01,
                            vertical: Get.height * .015),
                      ),
                      //
                      Container(
                        color: UIDataColors.greyColor,
                        child: Row(children: [
                          Container(
                            // color: Colors.red,
                            width: Get.width / 1 / 4,
                            child: Text("Phone:",
                                style: UIDataTextStyles.commontext),
                          ),
                          SizedBox(
                            width: Get.width / 1 / 3,
                            child: Text(
                                "(${box.read('uAcode')}) ${box.read('uPhone1')}-${box.read('uPhone2')}",
                                textAlign: TextAlign.start,
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
                            vertical: Get.height * .015,
                            horizontal: Get.width * .01),
                      ),
                      //
                      Container(
                        decoration: BoxDecoration(
                          border: Border.symmetric(
                              horizontal: BorderSide(
                            color: Color.fromARGB(102, 158, 158, 158),
                            width: 1.0,
                          )),
                        ),
                        child: Row(children: [
                          SizedBox(
                            width: Get.width / 1 / 4,
                            child: Text(
                              "cell:",
                              style: UIDataTextStyles.commontext,
                            ),
                          ),
                          SizedBox(
                            width: Get.width / 1 / 3,
                            child: Text(
                              "(${box.read('uAcode')}) ${box.read('uPhone1')}-${box.read('uPhone2')}",
                              textAlign: TextAlign.start,
                              style: UIDataTextStyles.commontext,
                            ),
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
                            horizontal: Get.width * .01,
                            vertical: Get.height * .015),
                      ),
                      //
                      Container(
                        color: UIDataColors.greyColor,
                        child: Row(children: [
                          Container(
                            // color: Colors.red,
                            width: Get.width / 1 / 4,
                            child: Text("Site Username:",
                                style: TextStyle(fontSize: Get.width * .025)),
                          ),
                          SizedBox(
                            width: Get.width / 1 / 3,
                            child: Text("${box.read('uname')}",
                                textAlign: TextAlign.start,
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
                            vertical: Get.height * .015,
                            horizontal: Get.width * .01),
                      ),
                      //
                      // Container(
                      //   decoration: BoxDecoration(
                      //     border: Border.symmetric(
                      //         horizontal: BorderSide(
                      //       color: Color.fromARGB(102, 158, 158, 158),
                      //       width: 1.0,
                      //     )),
                      //   ),
                      //   child: Row(children: [
                      //     Container(
                      //       width: Get.width / 1 / 4,
                      //       child: Text(
                      //         "Site Password:",
                      //         style: UIDataTextStyles.commontext,
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       width: Get.width / 1 / 3,
                      //       child: Text(
                      //         "(Don't Shown)",
                      //         textAlign: TextAlign.start,
                      //         style: UIDataTextStyles.commontext,
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       width: Get.width / 1 / 4,
                      //       child: GestureDetector(
                      //         onTap: () {
                      //           print("ok");
                      //         },
                      //         child: Text(
                      //           'Change',
                      //           textAlign: TextAlign.end,
                      //           style: TextStyle(
                      //               color: Colors.red,
                      //               fontSize: Get.width * .027),
                      //         ),
                      //       ),
                      //     ),
                      //   ]).paddingSymmetric(
                      //       horizontal: Get.width * .01,
                      //       vertical: Get.height * .015),
                      // ),
                      //
                      Container(
                        color: UIDataColors.greyColor,
                        child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                              Text('Cancel My SubScription',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: Get.width * .027))
                            ])
                            .marginOnly(top: Get.height * .015)
                            .paddingSymmetric(
                                vertical: Get.height * .015,
                                horizontal: Get.width * .01),
                      ),
                      //

                      Divider().marginSymmetric(
                        vertical: Get.height * .015,
                      ),

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
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )
          .paddingSymmetric(vertical: Get.height * 0.01)
          .marginSymmetric(horizontal: Get.height * 0.03),
    );
  }
}
