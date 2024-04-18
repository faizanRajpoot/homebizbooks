import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:hbb/src/controllers/showReportController.dart';
import 'package:hbb/src/controllers/weekly&confController.dart';
import 'package:hbb/src/utils/uidata/color.dart';

import '../../utils/uidata/text_styles.dart';

class WeeklyConferencedReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WeeklyConfController _ = Get.find<WeeklyConfController>();
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      // ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                'Weekly Meetings & Conference Calls Report \nfor ${_.arg['month']}, ${_.arg['year']}',
                textAlign: TextAlign.center,
                style: UIDataTextStyles.commontextheadbold,
              ).paddingSymmetric(horizontal: Get.width * 0.015),
            ],
          ).marginSymmetric(
              vertical: Get.height * 0.015, horizontal: Get.width * .03),

          // Divider(),

          // Divider(),
          // Text(
          //   'Note E = Daily Exposure K = National/International Exposure',
          //   style: TextStyle(color: Colors.red, fontSize: 12),
          // ).marginSymmetric(horizontal: 10),
          Container(
            height: 35,
            // width: Get.width,
            decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                      color: const Color.fromARGB(255, 212, 212, 212),
                      width: 1.0),
                  bottom: BorderSide(
                      color: const Color.fromARGB(255, 212, 212, 212),
                      width: 1.0),
                ),
                color: const Color.fromARGB(255, 237, 237, 237)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Data',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ).marginOnly(left: 10),
                  Text(
                    'Meeting Type',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ).marginOnly(left: 30),
                  Text(
                    'Location',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Training /\nConference Call',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ).marginOnly(right: Get.width * .04),
                ]),
          ).marginOnly(top: 9),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: Get.height - 310,
                  width: Get.width,
                  child: ListView.builder(
                      itemCount: 31,
                      itemBuilder: (BuildContext context, i) {
                        _.check(i + 1);
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          color: i % 2 == 0
                              ? Colors.white
                              : Color.fromARGB(255, 241, 241, 241),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  '${i + 1}/${_.arg['month']}/${_.arg['year']}'),
                              Container(
                                  width: 130,
                                  alignment: Alignment.center,
                                  child: Text('${_.ek}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis)),
                              Container(
                                  width: 110,
                                  alignment: Alignment.centerLeft,
                                  child: Text('${_.name}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis)),
                              Container(
                                  width: 50,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '${_.email}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ).marginOnly(right: 20)),
                            ],
                          ),
                        );
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        color: Colors.grey,
                        child: Text(
                          'Other Reports',
                          style: TextStyle(
                              color: Colors.white, fontSize: Get.width * 0.035),
                        ).marginSymmetric(
                            horizontal: Get.width * 0.03,
                            vertical: Get.height * 0.015),
                      ),
                    ),
                    Container(
                      color: UIDataColors.commonColor,
                      child: Text(
                        'Print',
                        style: TextStyle(
                            color: Colors.white, fontSize: Get.width * 0.035),
                      ).marginSymmetric(
                          horizontal: Get.width * 0.03,
                          vertical: Get.height * 0.015),
                    ).paddingSymmetric(horizontal: 10),
                  ],
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
