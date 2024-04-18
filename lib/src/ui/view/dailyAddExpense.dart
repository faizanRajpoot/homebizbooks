import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hbb/src/controllers/addExpController.dart';
import 'package:hbb/src/ui/widgets/commonClasses.dart';
import 'package:hbb/src/utils/routes/routes.dart';
import 'package:hbb/src/utils/uidata/color.dart';

class DailyAddExpenseScreen extends StatelessWidget {
  final AddExpController _ = Get.find<AddExpController>();

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
                            size: Get.width * 0.04,
                            color: Colors.black,
                          )),
                      Text(
                        '${_.arg['name']}',
                        style: TextStyle(
                            color: Colors.grey, fontSize: Get.width * .03),
                      ).paddingSymmetric(horizontal: Get.width * 0.015),
                    ],
                  ).marginSymmetric(
                      vertical: Get.height * .02, horizontal: Get.width * 0.02),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: Get.width,
                        // color: Colors.red,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GoalsTextField(
                              controller: _.amount,
                              hintText: "",
                              heading: "Amount",
                              readonly: false,
                              width: Get.width / 1.09,
                            ),
                            SizedBox(
                              height: Get.height * .02,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Relation Level:",
                                  style: TextStyle(
                                      fontSize: Get.width * .025,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  width: Get.width / 1.09,
                                  height: Get.height * .04,
                                  child: DropdownButtonFormField(
                                      style: TextStyle(
                                        fontSize: Get.width * .025,
                                        color: Colors.black,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: "Select",
                                        hintStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: Get.width * .025,
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: Get.height * .01,
                                            horizontal: 10),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 1),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          gapPadding: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 1),
                                        ),
                                      ),
                                      iconEnabledColor: Colors.black,
                                      iconSize: Get.width * .04,
                                      value: _.refValue,
                                      items: const [
                                        DropdownMenuItem<String>(
                                          value: 'Bus And Taxes Fare',
                                          child: Text('Bus And Taxes Fare'),
                                        ),
                                        DropdownMenuItem<String>(
                                          value: 'Busniess Oppurtunity Meeting',
                                          child: Text(
                                              'Busniess Oppurtunity Meeting'),
                                        ),
                                        DropdownMenuItem<String>(
                                          value: 'Entertainment',
                                          child: Text('Entertainment'),
                                        ),
                                        DropdownMenuItem<String>(
                                          value: 'Lodging',
                                          child: Text('Lodging'),
                                        ),
                                        DropdownMenuItem<String>(
                                          value: 'Meals',
                                          child: Text('Meals'),
                                        ),
                                        DropdownMenuItem<String>(
                                          value: 'Mileage',
                                          child: Text('Mileage'),
                                        ),
                                        DropdownMenuItem<String>(
                                          value: 'Parking',
                                          child: Text('Parking'),
                                        ),
                                        DropdownMenuItem<String>(
                                          value: 'Toll',
                                          child: Text('Toll'),
                                        ),
                                        DropdownMenuItem<String>(
                                          value: 'Other',
                                          child: Text('Other'),
                                        ),
                                      ],
                                      onChanged: (value) {
                                        print(value);
                                        _.refValue = value;
                                        if (value == 'Mileage') {
                                          _.addExCheck.value = false;
                                        } else {
                                          _.addExCheck.value = true;
                                        }
                                      }),
                                ),
                              ],
                            ).marginSymmetric(horizontal: Get.width * .025),
                          ],
                        ),
                      ),
                      Container(
                        width: Get.width,
                        // height: Get.height * .8,
                        // color: const Color.fromARGB(255, 54, 244, 149),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Expense Description',
                              style: TextStyle(
                                  fontSize: Get.width * .03,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: Get.height * .01,
                            ),
                            Obx(
                              () => _.addExCheck.value
                                  ? Text(
                                      'Select an Expense Type from dropdown on the top side of the page',
                                      style: TextStyle(
                                          fontSize: Get.width * .03,
                                          fontWeight: FontWeight.w400),
                                    )
                                  : Text(
                                      'There are two methods for calculating vehicle expenses, the easiest and probably the best for network marketers is method one, the standard flat mileage rate. The IRS has set the 2023 standard mileage rate used to calculate the deductible costs of operating an automobile for business at 65.5 cents per mile.',
                                      style: TextStyle(
                                          fontSize: Get.width * .03,
                                          fontWeight: FontWeight.w400),
                                    ),
                            ),
                            SizedBox(
                              height: Get.height * .01,
                            ),
                            Obx(() => _.addExCheck.value
                                ? SizedBox()
                                : InkWell(
                                    onTap: () {
                                      Get.dialog(Center(
                                          child: AlertDialog(
                                        // contentPadding: EdgeInsets.only(
                                        //   left: 0.0,
                                        //   top: 0.0,
                                        //   right: 0.0,
                                        //   bottom: 24.0,
                                        // ),
                                        content: Container(
                                          height: Get.height / 1.5,
                                          width: Get.width,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                'Mileage Calculator',
                                                style: TextStyle(
                                                    fontSize: Get.width * .03,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                'Note: You can fill in either beginning and ending odometer readings or just the total trip miles to calculate the trip costs.',
                                                textAlign: TextAlign.center,
                                              ).marginOnly(bottom: 20),
                                              Text(
                                                'Date:',
                                                style: TextStyle(
                                                    fontSize: Get.width * .03,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Container(
                                                // width: Get.width / 1.4,
                                                height: Get.height * .04,
                                                child: DropdownButtonFormField(
                                                    style: TextStyle(
                                                      fontSize:
                                                          Get.width * .025,
                                                      color: Colors.black,
                                                    ),
                                                    decoration: InputDecoration(
                                                      hintText: "Select",
                                                      hintStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontSize:
                                                            Get.width * .025,
                                                      ),
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              vertical:
                                                                  Get.height *
                                                                      .01,
                                                              horizontal: 10),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        borderSide: BorderSide(
                                                            color: Colors.black,
                                                            width: 1),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        borderSide: BorderSide(
                                                            color: Colors.black,
                                                            width: 1),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        gapPadding: 0.0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        borderSide: BorderSide(
                                                            color: Colors.black,
                                                            width: 1),
                                                      ),
                                                    ),
                                                    iconEnabledColor:
                                                        Colors.black,
                                                    iconSize: Get.width * .04,
                                                    value: _.addExDate,
                                                    items: const [
                                                      DropdownMenuItem<String>(
                                                        value: '0.56',
                                                        child: Text('2021'),
                                                      ),
                                                      DropdownMenuItem<String>(
                                                        value: '0.585',
                                                        child: Text('2022'),
                                                      ),
                                                      DropdownMenuItem<String>(
                                                        value: '0.655',
                                                        child: Text('2023'),
                                                      ),
                                                      DropdownMenuItem<String>(
                                                        value: '0.67',
                                                        child: Text('2024'),
                                                      ),
                                                    ],
                                                    onChanged: (value) {
                                                      _.addExDate = value;
                                                      _.milageRateText.text =
                                                          value.toString();
                                                    }).marginSymmetric(horizontal: 8),
                                              ),
                                              Text(
                                                'Milage Rate:',
                                                style: TextStyle(
                                                    fontSize: Get.width * .03,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              GoalsTextField(
                                                controller: _.milageRateText,
                                                hintText: "",
                                                heading: "",
                                                readonly: false,
                                                width: Get.width / 1.55,
                                              ),
                                              Text(
                                                'Begininning Odometer Reading:',
                                                style: TextStyle(
                                                    fontSize: Get.width * .03,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              GoalsTextField(
                                                controller: _.begReading,
                                                hintText: "",
                                                heading: "",
                                                readonly: false,
                                                width: Get.width / 1.55,
                                              ),
                                              Text(
                                                'Ending Odometer Reading:',
                                                style: TextStyle(
                                                    fontSize: Get.width * .03,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              GoalsTextField(
                                                controller: _.endReading,
                                                hintText: "",
                                                heading: "",
                                                readonly: false,
                                                width: Get.width / 1.55,
                                              ),
                                              Text(
                                                'Miles this trip:',
                                                style: TextStyle(
                                                    fontSize: Get.width * .03,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Container(
                                                width: Get.width / 1.55,
                                                // width: width,
                                                height: Get.height * .04,
                                                decoration: BoxDecoration(
                                                  border: Border.all(width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5)),
                                                ),
                                                child: TextField(
                                                  // readOnly: readonly,
                                                  // keyboardType: TextInputType.number,
                                                  // inputFormatters: keyboard,
                                                  onTap: () {
                                                    if (_.begReading.text
                                                            .isNotEmpty &&
                                                        _.endReading.text
                                                            .isNotEmpty) {
                                                      print(int.parse(_
                                                              .endReading
                                                              .text) -
                                                          int.parse(_.begReading
                                                              .text));
                                                      var total = int.parse(_
                                                              .endReading
                                                              .text) -
                                                          int.parse(_
                                                              .begReading.text);
                                                      _.miles.text =
                                                          total.toString();
                                                    }
                                                  },
                                                  controller: _.miles,
                                                  style: TextStyle(
                                                    fontSize: Get.width * .025,
                                                  ),
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintStyle: TextStyle(
                                                        color: Colors.black),
                                                    // hintText: hintText,
                                                  ),
                                                )
                                                    .paddingSymmetric(
                                                        horizontal:
                                                            Get.width * .01)
                                                    .paddingOnly(bottom: 8),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  if (_.miles.text.isNotEmpty &&
                                                      _.milageRateText.text
                                                          .isNotEmpty) {
                                                    var total = double.parse(_
                                                            .milageRateText
                                                            .text) *
                                                        int.parse(_.miles.text);
                                                    // var total= 6*double.parse('0.55');
                                                    // print(total.toStringAsFixed(2));
                                                    _.amount.text = total
                                                        .toStringAsFixed(2);
                                                    Get.back();
                                                  } else {
                                                    Get.snackbar('Error',
                                                        'Miles Is Required',
                                                        snackPosition:
                                                            SnackPosition
                                                                .BOTTOM,
                                                        backgroundColor:
                                                            Colors.red,
                                                        colorText:
                                                            Colors.white);
                                                  }
                                                },
                                                child: Container(
                                                  width: 120,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 5),
                                                  decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 233, 233, 233),
                                                    border: Border.all(
                                                      color: const Color
                                                          .fromARGB(255, 0, 0,
                                                          0), // Set the border color
                                                      width:
                                                          1.0, // Set the border width
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10), // Optional: Set border radius
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.calculate,
                                                        size: 18,
                                                      ).marginOnly(right: 5),
                                                      Text('Calculater'),
                                                    ],
                                                  ),
                                                ).marginOnly(top: 40),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )));
                                    },
                                    child: Container(
                                      width: 120,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 233, 233, 233),
                                        border: Border.all(
                                          color: const Color.fromARGB(255, 0, 0,
                                              0), // Set the border color
                                          width: 1.0, // Set the border width
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            10), // Optional: Set border radius
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.calculate,
                                            size: 18,
                                          ).marginOnly(right: 5),
                                          Text('Calculater'),
                                        ],
                                      ),
                                    ),
                                  ))
                            // Text(
                            //   'A brief Description will appear in this area',
                            //   style: TextStyle(
                            //       fontSize: Get.width * .03,
                            //       fontWeight: FontWeight.w400),
                            // )
                          ],
                        ),
                      ).marginSymmetric(
                          horizontal: Get.width * .025,
                          vertical: Get.height * 0.025)
                    ],
                  ).marginSymmetric(vertical: Get.height * 0.01),
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
                            'Close',
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
                          Get.offAndToNamed(Routes.activity);
                        },
                        child: Container(
                          color: UIDataColors.commonColor,
                          child: Text(
                            'Save',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: Get.width * 0.035),
                          ).marginSymmetric(
                              horizontal: Get.width * 0.04,
                              vertical: Get.height * 0.01),
                        ).paddingSymmetric(horizontal: 10),
                      ),
                    ],
                  ).marginSymmetric(vertical: Get.height * 0.03),
                ],
              ),
            ).marginSymmetric(horizontal: Get.width * 0.02),
          )),
    );
  }
}

//
