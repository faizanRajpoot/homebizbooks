// ignore_for_file: unused_field
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hbb/src/controllers/coachNetworkController.dart';
import 'package:hbb/src/utils/uidata/text_styles.dart';

class CoachNetworkScreen extends StatelessWidget {
  final CoachNetworkController _ = Get.put(CoachNetworkController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        // ),
        body: _.loader.value
            ? SafeArea(
                child: Container(
                  height: Get.height,
                  width: Get.width,
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
                            "Coaching Network",
                            textAlign: TextAlign.start,
                            style: UIDataTextStyles.headingtextbold,
                          ).paddingSymmetric(horizontal: Get.width * 0.015),
                        ],
                      ).marginOnly(top: Get.height * .02),
                      Text(
                        "This is a list of all the people in your Coaching Network. As their Coach you have access to view their calendar page, for the purpose of seeing any areas they may need help and guidance with. You can access it directly by clicking the calendar icon against their name on this page.",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: Get.width * .032,
                            fontWeight: FontWeight.w500),
                      ).marginSymmetric(vertical: Get.height * .02),
                      Container(
                        width: Get.width,
                        // height: Get.height * .15,
                        decoration: BoxDecoration(
                          // color: Colors.black,
                          border: Border.all(width: 1, color: Colors.grey),
                        ),

                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: Get.width / 4,
                                  height: Get.height * .03,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey,
                                        width: 0,
                                      ),
                                      right: BorderSide(
                                        color: Colors.grey,
                                        width: 0,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    'Name',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: Get.width * .025),
                                  ),
                                ),
                                Container(
                                  width: Get.width / 4,
                                  height: Get.height * .03,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey,
                                        width: 0,
                                      ),
                                      right: BorderSide(
                                        color: Colors.grey,
                                        width: 0,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    'Phone',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: Get.width * .025),
                                  ),
                                ),
                                Container(
                                  width: Get.width / 2.46,
                                  height: Get.height * .03,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey,
                                        width: 0,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    'Email',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: Get.width * .025),
                                  ),
                                ),
                              ],
                            ),

                            //
                            Container(
                              height: Get.height / 8.5,
                              width: Get.width,
                              child: ListView.builder(
                                  itemCount: _.data.length,
                                  itemBuilder: (BuildContext context, index) {
                                    return Container(
                                      color: Colors.grey.shade100,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: Get.width / 4,
                                            height: Get.height * .03,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Colors.grey,
                                                  width: 0,
                                                ),
                                                right: BorderSide(
                                                  color: Colors.grey,
                                                  width: 0,
                                                ),
                                              ),
                                            ),
                                            child: Text(
                                                    '${_.data[index]['displayname']}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            Get.width * .02),
                                                    overflow:
                                                        TextOverflow.ellipsis)
                                                .paddingSymmetric(
                                                    horizontal:
                                                        Get.width * .01),
                                          ),
                                          Container(
                                            width: Get.width / 4,
                                            height: Get.height * .03,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Colors.grey,
                                                  width: 0,
                                                ),
                                                right: BorderSide(
                                                  color: Colors.grey,
                                                  width: 0,
                                                ),
                                              ),
                                            ),
                                            child: Text(
                                                    '${_.data[index]['acode']}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            Get.width * .02),
                                                    overflow:
                                                        TextOverflow.ellipsis)
                                                .paddingSymmetric(
                                                    horizontal:
                                                        Get.width * .01),
                                          ),
                                          //
                                          Container(
                                            width: Get.width / 2.46,
                                            height: Get.height * .03,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Colors.grey,
                                                  width: 0,
                                                ),
                                              ),
                                            ),
                                            child: Text(
                                              '${_.data[index]['email']}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: Get.width * .02),
                                              overflow: TextOverflow.ellipsis,
                                            ).paddingSymmetric(
                                                horizontal: Get.width * .01),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          ],
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
                                    color: Colors.red,
                                    fontSize: Get.width * .035),
                              ),
                            ),
                          ).marginSymmetric(vertical: Get.height * .02),
                        ],
                      ),
                    ],
                  ),
                ),
              )
                .paddingSymmetric(vertical: Get.height * 0.01)
                .marginSymmetric(horizontal: Get.height * 0.02)
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
