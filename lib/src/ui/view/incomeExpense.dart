// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hbb/src/controllers/addincomeexpenseController.dart';
import 'package:hbb/src/controllers/incomeExpenseController.dart';
import 'package:hbb/src/utils/routes/routes.dart';
import 'package:hbb/src/utils/uidata/color.dart';
import 'package:hbb/src/utils/uidata/text_styles.dart';

class IncomeExpenseScreen extends StatelessWidget {
  final IncomeExpenseController _ = Get.put(IncomeExpenseController());
  final AddIncomeExpenseController _addIncomeExpenseController =
      Get.put(AddIncomeExpenseController());

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
                        Get.offAndToNamed(Routes.home);
                        print('object');
                      },
                      child: Icon(
                        Icons.arrow_back_outlined,
                        size: Get.width * 0.05,
                        color: Colors.black,
                      )),
                  Text(
                    "My Income And Expense",
                    textAlign: TextAlign.start,
                    style: UIDataTextStyles.headingtextbold,
                  ).paddingSymmetric(horizontal: Get.width * 0.015),
                ],
              ).marginSymmetric(vertical: Get.height * .02),
              Container(
                width: Get.width,
                height: Get.height * 0.5,
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
                          width: Get.width / 5,
                          height: Get.height * .03,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            // color: Colors.amber,
                            // color: Colors.black,
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                              right: BorderSide(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Text(
                            'Date',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: Get.width * .025),
                          ),
                        ),
                        //
                        Container(
                          width: Get.width / 3.5,
                          height: Get.height * .03,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            // color: Colors.amber,
                            // color: Colors.black,
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                              right: BorderSide(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Text(
                            'Purpose',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: Get.width * .025),
                          ),
                        ),
                        //
                        Container(
                          width: Get.width / 4 / 1.7,
                          height: Get.height * .03,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            // color: Colors.amber,
                            // color: Colors.black,
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                              right: BorderSide(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Text(
                            'Income',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: Get.width * .025),
                          ),
                        ),

                        //

                        Container(
                          width: Get.width / 4,
                          height: Get.height * .03,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            // color: Colors.amber,
                            // color: Colors.black,
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Text(
                            'Expense',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: Get.width * .025),
                          ),
                        ),
                      ],
                    ),
                    //
                    Obx(
                      () => _.loader.value
                          ? Container(
                              height: Get.height * 0.45,
                              alignment: Alignment.center,
                              child: ListView.builder(
                                  itemCount: _.incomeExpenseData.length,
                                  itemBuilder: ((context, index) {
                                    return Row(
                                      children: [
// Date
                                        Container(
                                          width: Get.width / 5,
                                          height: Get.height * .03,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Colors.grey,
                                                width: 1.0,
                                              ),
                                              right: BorderSide(
                                                color: Colors.grey,
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          child: Text(
                                            '${_.incomeExpenseData[index]['expensedate']}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: Get.width * .025),
                                            overflow: TextOverflow.clip,
                                          ).paddingSymmetric(horizontal: 10),
                                        ),
// Expense Reason
                                        Container(
                                          width: Get.width / 3.5,
                                          height: Get.height * .03,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Colors.grey,
                                                width: 1.0,
                                              ),
                                              right: BorderSide(
                                                color: Colors.grey,
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          child: Text(
                                            '${_.incomeExpenseData[index]['expensereason']}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: Get.width * .025),
                                            overflow: TextOverflow.ellipsis,
                                          ).paddingSymmetric(horizontal: 10),
                                        ),
// Income Amount
                                        Container(
                                          width: Get.width / 4 / 1.7,
                                          height: Get.height * .03,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Colors.grey,
                                                width: 1.0,
                                              ),
                                              right: BorderSide(
                                                color: Colors.grey,
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          child: Text(
                                            _.incomeExpenseData[index]
                                                        ['income'] ==
                                                    1
                                                ? " \$${_.incomeExpenseData[index]['expenseamount']}" +
                                                    '${_.incomeExpenseData[index]['expenseamount'].toString().contains('.') ? '' : '.00'}'
                                                : '',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: Get.width * .025),
                                          ),
                                        ),
// Expense Amount
                                        Container(
                                          width: Get.width / 6.5,
                                          height: Get.height * .03,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Colors.grey,
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          child: Text(
                                            _.incomeExpenseData[index]
                                                        ['income'] ==
                                                    0
                                                ? '\$${_.incomeExpenseData[index]['expenseamount']}' +
                                                    '${_.incomeExpenseData[index]['expenseamount'].toString().contains('.') ? '' : '.00'}'
                                                : '',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: Get.width * .025),
                                          ),
                                        ),
// Edit Button
                                        InkWell(
                                          onTap: () {
                                            // print(_.data[index]['id']);
                                            _.editId = _
                                                .incomeExpenseData[index]['id'];
                                            Get.toNamed(
                                                Routes.addincomeexpense);
                                            _.isUpdate.value = true;
                                            _addIncomeExpenseController
                                                .edit(index);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Colors.grey,
                                                  width: 1.0,
                                                ),
                                              ),
                                            ),
                                            height: Get.height * .03,
                                            child: Icon(
                                              Icons.edit,
                                              color: Colors.grey,
                                              size: 18,
                                            ).paddingSymmetric(horizontal: 10),
                                          ),
                                        ),
// Delete Button

                                        InkWell(
                                          onTap: () {
                                            Get.dialog(AlertDialog(
                                              title: Text(
                                                'Are you sure you want to Delete this ?',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.red.shade500),
                                              ),
                                              actions: [
                                                InkWell(
                                                  onTap: () {
                                                    Get.back();
                                                  },
                                                  child: Text('Cancel'),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    _.editId =
                                                        _.incomeExpenseData[
                                                            index]['id'];
                                                    _.delete();
                                                    Get.back();
                                                  },
                                                  child: Text(
                                                    'Delete',
                                                    style: TextStyle(
                                                        color: Colors
                                                            .red.shade500),
                                                  ),
                                                ),
                                              ],
                                            ));
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Colors.grey,
                                                  width: 1.0,
                                                ),
                                              ),
                                            ),
                                            height: Get.height * .03,
                                            child: Icon(
                                              Icons.delete_forever,
                                              color: Colors.red.shade500,
                                              size: 18,
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  })))
                          : Center(
                              child: CircularProgressIndicator(),
                            ),
                    )

                    // .marginSymmetric(vertical: Get.height * .03)
                    // Text(
                    //     'You currently have no income or expense items for January 2024,(Remember you can only display income and expenses back to January 1st of the year you joined this program) ',
                    //     style: TextStyle(
                    //       fontSize: Get.width * .025,
                    //     ),
                    //     textAlign: TextAlign.center,
                    //   ),
                  ],
                ),
              ),
              Row(
                children: [
                  Stack(
                    children: [
                      // Container with content
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.addincomeexpense);
                          print('object');
                        },
                        child: Container(
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
                            children: [
                              Icon(
                                Icons.add_comment_rounded,
                                size: Get.width * .04,
                              ),
                              Text(
                                'Add Inome and Expense',
                                style: TextStyle(
                                  fontSize: Get.width * .025,
                                  color: Colors.black,
                                ),
                              ).marginSymmetric(horizontal: Get.width * .02),
                            ],
                          ).paddingSymmetric(horizontal: Get.width * .01),
                        ),
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
                  Spacer(),
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
                  ),
                ],
              ).marginSymmetric(vertical: Get.height * .02),
            ],
          ),
        ),
      )
          .paddingSymmetric(vertical: Get.height * 0.01)
          .marginSymmetric(horizontal: Get.height * 0.02),
    );
  }
}
