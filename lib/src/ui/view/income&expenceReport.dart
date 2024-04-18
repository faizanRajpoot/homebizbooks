import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hbb/src/controllers/incomeExpenceRepController.dart';

import 'package:hbb/src/utils/uidata/color.dart';

class IncomeExpenceReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    IncomeExpenceRepController _ = Get.find<IncomeExpenceRepController>();
    return Scaffold(
      //  appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      // ),
      body: SafeArea(
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
              Text('Income & Expenses Report for ${_.arg['month']}, ${_.arg['year']}',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w900))
                  .paddingSymmetric(horizontal: Get.width * 0.015),
            ],
          ).marginSymmetric(vertical: Get.height * .02),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 35,
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
                    'Purpose',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ).marginOnly(left: 30),
                  Text(
                    'Income',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Expenditures',
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
                      itemCount: _.data.length,
                      itemBuilder: (BuildContext context, i) {
                        // _.check(i + 1);
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          color: i % 2 == 0
                              ? Colors.white
                              : Color.fromARGB(255, 241, 241, 241),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${_.data[i]['expensedate']}'),
                              Container(
                                  width: 130,
                                  alignment: Alignment.center,
                                  child: Text('${_.data[i]['expensereason']}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis)),
                              Container(
                                      width: 50,
                                      alignment: Alignment.centerLeft,
                                      child: Text('${_.data[i]['income']}',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis))
                                  .marginOnly(right: 40),
                              Container(
                                  width: 50,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '${_.data[i]['expenseamount']}',
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
