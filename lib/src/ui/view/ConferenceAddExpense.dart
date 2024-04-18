import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hbb/src/ui/widgets/commonClasses.dart';
import 'package:hbb/src/utils/uidata/color.dart';
import '../../controllers/conferenceCallController.dart';

class ConferenceAddExpenseScreen extends StatelessWidget {
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
                        'Conference Call',
                        style: TextStyle(
                            color: Colors.grey, fontSize: Get.width * .03),
                      ).paddingSymmetric(horizontal: Get.width * 0.015),
                    ],
                  ).marginSymmetric(
                    vertical: Get.height * .02,
                    horizontal: Get.width * 0.02,
                  ),
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
                                        _.refValue = value;
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
                            Text(
                              'Select an Expense Type from dropdown on the top side of the page',
                              style: TextStyle(
                                  fontSize: Get.width * .03,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: Get.height * .01,
                            ),
                            Text(
                              'A brief Description will appear in this area',
                              style: TextStyle(
                                  fontSize: Get.width * .03,
                                  fontWeight: FontWeight.w400),
                            )
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
                      Container(
                        color: UIDataColors.commonColor,
                        child: Text(
                          'Save',
                          style: TextStyle(
                              color: Colors.white, fontSize: Get.width * 0.035),
                        ).marginSymmetric(
                            horizontal: Get.width * 0.04,
                            vertical: Get.height * 0.01),
                      ).paddingSymmetric(horizontal: 10),
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
