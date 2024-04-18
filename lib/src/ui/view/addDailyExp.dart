// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hbb/src/controllers/addDailyExpController.dart';
import 'package:hbb/src/ui/widgets/commonClasses.dart';
import 'package:hbb/src/utils/uidata/color.dart';
import 'package:intl/intl.dart';


class AddDailyExpScreen extends StatelessWidget {
  final AddDailyExpController _ = Get.find<AddDailyExpController>();

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
                          ),
                        ),
                        Text(
                          'Daily Exposures. ${_.formattedDate}',
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
                      controller: _.prospectsName,
                      hintText: '',
                      readonly: false,
                      heading: "Prospect's Name:",
                    ),

                    SizedBox(
                      height: Get.height * .01,
                    ),
                    GoalsTextField(
                      width: Get.width / 1.09,
                      controller: _.phoneNo,
                      hintText: '',
                      readonly: false,
                      heading: "Phone Number:",
                    ),

                    SizedBox(
                      height: Get.height * .01,
                    ),
                    GoalsTextField(
                      width: Get.width / 1.09,
                      controller: _.cellPhone,
                      hintText: '',
                      readonly: false,
                      heading: "CellPhone Number:",
                    ),

                    SizedBox(
                      height: Get.height * .01,
                    ),
                    GoalsTextField(
                      width: Get.width / 1.09,
                      controller: _.email,
                      hintText: '',
                      readonly: false,
                      heading: "Email Address:",
                    ),

                    SizedBox(
                      height: Get.height * .01,
                    ),
                    GoalsTextField(
                      width: Get.width / 1.09,
                      controller: _.address,
                      hintText: '',
                      readonly: false,
                      heading: "Address:",
                    ),

                    SizedBox(
                      height: Get.height * .01,
                    ),
                    GoalsTextField(
                      width: Get.width * .4,
                      controller: _.city,
                      hintText: '',
                      readonly: false,
                      heading: "City:",
                      secondwidth: Get.width * .25,
                      secheading: "State:",
                      sechintText: "",
                      secreadonly: false,
                      seccontroller: _.state,
                      thirdheading: 'Zip:',
                      thirdhintText: '',
                      thirdwidth: Get.width * .25,
                      thirdcontroller: _.zip,
                      thirdreadonly: false,
                    ),

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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Follow Up Date:",
                          style: TextStyle(
                              fontSize: Get.width * .04,
                              fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () async {
                            DateTime currentDate = DateTime.now();
                             DateTime next15Days = currentDate.add(Duration(days: 15));
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                // firstDate: DateTime(2000),
                                firstDate: DateTime.now(),
                                lastDate: next15Days);

                            if (pickedDate != null) {
                              String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

                              _.followUP = formattedDate;
                            } else {
                              print("Date is not selected");
                            }
                          },
                          child: Text(
                            "Click Here To Set",
                            style: TextStyle(
                                fontSize: Get.width * .025,
                                color: Colors.red,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ).paddingSymmetric(horizontal: Get.width * .02),

                    SizedBox(
                      height: Get.height * .01,
                    ),
                    GoalsTextField(
                      width: Get.width / 1.09,
                      controller: _.timeCall,
                      hintText: '',
                      readonly: false,
                      heading: "Best Time to Call:",
                    ),

                    SizedBox(
                      height: Get.height * .01,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Method Of Expousure:",
                          style: TextStyle(
                              fontSize: Get.width * .04,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: Get.height * .01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Obx(
                              () => Container(
                                // color: Colors.red,
                                height: Get.height * .02,
                                width: Get.width * .03,
                                child: Checkbox(
                                  checkColor: Colors.white,
                                  side: BorderSide(
                                      width: 01, color: Colors.black),
                                  activeColor: Colors.red.shade500,
                                  value: _.checkbox1.value,
                                  onChanged: (bool? v) {
                                    _.checkbox1.value = v ?? false;
                                  },
                                ),
                              ),
                            ),
                            Text(
                              '3 Ways to Call',
                              style: TextStyle(
                                  fontSize: Get.width * .03,
                                  fontWeight: FontWeight.bold),
                            ).paddingSymmetric(horizontal: Get.width * .03),
                          ],
                        ).paddingSymmetric(horizontal: Get.width * .01),
                        //
                        SizedBox(
                          height: Get.height * .002,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Obx(
                              () => Container(
                                // color: Colors.red,
                                height: Get.height * .02,
                                width: Get.width * .03,
                                child: Checkbox(
                                  checkColor: Colors.white,
                                  side: BorderSide(
                                      width: 01, color: Colors.black),
                                  activeColor: Colors.red.shade500,
                                  value: _.checkbox2.value,
                                  onChanged: (bool? v) {
                                    _.checkbox2.value = v ?? false;
                                  },
                                ),
                              ),
                            ),
                            Text(
                              'Business Breifing',
                              style: TextStyle(
                                  fontSize: Get.width * .03,
                                  fontWeight: FontWeight.bold),
                            ).paddingSymmetric(horizontal: Get.width * .03),
                          ],
                        ).paddingSymmetric(horizontal: Get.width * .01),
                        //
                        SizedBox(
                          height: Get.height * .002,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Obx(
                              () => Container(
                                // color: Colors.red,
                                height: Get.height * .02,
                                width: Get.width * .03,
                                child: Checkbox(
                                  checkColor: Colors.white,
                                  side: BorderSide(
                                      width: 01, color: Colors.black),
                                  activeColor: Colors.red.shade500,
                                  value: _.checkbox3.value,
                                  onChanged: (bool? v) {
                                    _.checkbox3.value = v ?? false;
                                  },
                                ),
                              ),
                            ),
                            Text(
                              'Business Card',
                              style: TextStyle(
                                  fontSize: Get.width * .03,
                                  fontWeight: FontWeight.bold),
                            ).paddingSymmetric(horizontal: Get.width * .03),
                          ],
                        ).paddingSymmetric(horizontal: Get.width * .01),
                        //
                        SizedBox(
                          height: Get.height * .002,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Obx(
                              () => Container(
                                // color: Colors.red,
                                height: Get.height * .02,
                                width: Get.width * .03,
                                child: Checkbox(
                                  checkColor: Colors.white,
                                  side: BorderSide(
                                      width: 01, color: Colors.black),
                                  activeColor: Colors.red.shade500,
                                  value: _.checkbox4.value,
                                  onChanged: (bool? v) {
                                    _.checkbox4.value = v ?? false;
                                  },
                                ),
                              ),
                            ),
                            Text(
                              'Conference Call',
                              style: TextStyle(
                                  fontSize: Get.width * .03,
                                  fontWeight: FontWeight.bold),
                            ).paddingSymmetric(horizontal: Get.width * .03),
                          ],
                        ).paddingSymmetric(horizontal: Get.width * .01),
                        //
                        SizedBox(
                          height: Get.height * .002,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Obx(
                              () => Container(
                                // color: Colors.red,
                                height: Get.height * .02,
                                width: Get.width * .03,
                                child: Checkbox(
                                  checkColor: Colors.white,
                                  side: BorderSide(
                                      width: 01, color: Colors.black),
                                  activeColor: Colors.red.shade500,
                                  value: _.checkbox5.value,
                                  onChanged: (bool? v) {
                                    _.checkbox5.value = v ?? false;
                                  },
                                ),
                              ),
                            ),
                            Text(
                              'DVD/CD',
                              style: TextStyle(
                                  fontSize: Get.width * .03,
                                  fontWeight: FontWeight.bold),
                            ).paddingSymmetric(horizontal: Get.width * .03),
                          ],
                        ).paddingSymmetric(horizontal: Get.width * .01),
                        //
                        SizedBox(
                          height: Get.height * .002,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Obx(
                              () => Container(
                                // color: Colors.red,
                                height: Get.height * .02,
                                width: Get.width * .03,
                                child: Checkbox(
                                  checkColor: Colors.white,
                                  side: BorderSide(
                                      width: 01, color: Colors.black),
                                  activeColor: Colors.red.shade500,
                                  value: _.checkbox6.value,
                                  onChanged: (bool? v) {
                                    _.checkbox6.value = v ?? false;
                                  },
                                ),
                              ),
                            ),
                            Text(
                              'Home Meeting/Party (PBR)',
                              style: TextStyle(
                                  fontSize: Get.width * .03,
                                  fontWeight: FontWeight.bold),
                            ).paddingSymmetric(horizontal: Get.width * .03),
                          ],
                        ).paddingSymmetric(horizontal: Get.width * .01),
                        //
                        SizedBox(
                          height: Get.height * .002,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Obx(
                              () => Container(
                                // color: Colors.red,
                                height: Get.height * .02,
                                width: Get.width * .03,
                                child: Checkbox(
                                  checkColor: Colors.white,
                                  side: BorderSide(
                                      width: 01, color: Colors.black),
                                  activeColor: Colors.red.shade500,
                                  value: _.checkbox7.value,
                                  onChanged: (bool? v) {
                                    _.checkbox7.value = v ?? false;
                                  },
                                ),
                              ),
                            ),
                            Text(
                              'Information Packet',
                              style: TextStyle(
                                  fontSize: Get.width * .03,
                                  fontWeight: FontWeight.bold),
                            ).paddingSymmetric(horizontal: Get.width * .03),
                          ],
                        ).paddingSymmetric(horizontal: Get.width * .01),
                        //
                        SizedBox(
                          height: Get.height * .002,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Obx(
                              () => Container(
                                // color: Colors.red,
                                height: Get.height * .02,
                                width: Get.width * .03,
                                child: Checkbox(
                                  checkColor: Colors.white,
                                  side: BorderSide(
                                      width: 01, color: Colors.black),
                                  activeColor: Colors.red.shade500,
                                  value: _.checkbox8.value,
                                  onChanged: (bool? v) {
                                    _.checkbox8.value = v ?? false;
                                  },
                                ),
                              ),
                            ),
                            Text(
                              'Online Webinar',
                              style: TextStyle(
                                  fontSize: Get.width * .03,
                                  fontWeight: FontWeight.bold),
                            ).paddingSymmetric(horizontal: Get.width * .03),
                          ],
                        ).paddingSymmetric(horizontal: Get.width * .01),
                        //
                        SizedBox(
                          height: Get.height * .002,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Obx(
                              () => Container(
                                // color: Colors.red,
                                height: Get.height * .02,
                                width: Get.width * .03,
                                child: Checkbox(
                                  checkColor: Colors.white,
                                  side: BorderSide(
                                      width: 01, color: Colors.black),
                                  activeColor: Colors.red.shade500,
                                  value: _.checkbox9.value,
                                  onChanged: (bool? v) {
                                    _.checkbox9.value = v ?? false;
                                  },
                                ),
                              ),
                            ),
                            Text(
                              'Pre-Record Call',
                              style: TextStyle(
                                  fontSize: Get.width * .03,
                                  fontWeight: FontWeight.bold),
                            ).paddingSymmetric(horizontal: Get.width * .03),
                          ],
                        ).paddingSymmetric(horizontal: Get.width * .01),
                        //
                        SizedBox(
                          height: Get.height * .002,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Obx(
                              () => Container(
                                // color: Colors.red,
                                height: Get.height * .02,
                                width: Get.width * .03,
                                child: Checkbox(
                                  checkColor: Colors.white,
                                  side: BorderSide(
                                      width: 01, color: Colors.black),
                                  activeColor: Colors.red.shade500,
                                  value: _.checkbox10.value,
                                  onChanged: (bool? v) {
                                    _.checkbox10.value = v ?? false;
                                  },
                                ),
                              ),
                            ),
                            Text(
                              'SitDown (FlipChart, Brochure, etc)',
                              style: TextStyle(
                                  fontSize: Get.width * .03,
                                  fontWeight: FontWeight.bold),
                            ).paddingSymmetric(horizontal: Get.width * .03),
                          ],
                        ).paddingSymmetric(horizontal: Get.width * .01),
                        //
                        SizedBox(
                          height: Get.height * .002,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Obx(
                              () => Container(
                                // color: Colors.red,
                                height: Get.height * .02,
                                width: Get.width * .03,
                                child: Checkbox(
                                  checkColor: Colors.white,
                                  side: BorderSide(
                                      width: 01, color: Colors.black),
                                  activeColor: Colors.red.shade500,
                                  value: _.checkbox11.value,
                                  onChanged: (bool? v) {
                                    _.checkbox11.value = v ?? false;
                                  },
                                ),
                              ),
                            ),
                            Text(
                              'Social Media',
                              style: TextStyle(
                                  fontSize: Get.width * .03,
                                  fontWeight: FontWeight.bold),
                            ).paddingSymmetric(horizontal: Get.width * .03),
                          ],
                        ).paddingSymmetric(horizontal: Get.width * .01),
                        //
                        SizedBox(
                          height: Get.height * .002,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Obx(
                              () => Container(
                                // color: Colors.red,
                                height: Get.height * .02,
                                width: Get.width * .03,
                                child: Checkbox(
                                  checkColor: Colors.white,
                                  side: BorderSide(
                                      width: 01, color: Colors.black),
                                  activeColor: Colors.red.shade500,
                                  value: _.checkbox12.value,
                                  onChanged: (bool? v) {
                                    _.checkbox12.value = v ?? false;
                                  },
                                ),
                              ),
                            ),
                            Text(
                              'Website',
                              style: TextStyle(
                                  fontSize: Get.width * .03,
                                  fontWeight: FontWeight.bold),
                            ).paddingSymmetric(horizontal: Get.width * .03),
                          ],
                        ).paddingSymmetric(horizontal: Get.width * .01),
                        //
                        SizedBox(
                          height: Get.height * .002,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Obx(
                              () => Container(
                                height: Get.height * .02,
                                width: Get.width * .03,
                                child: Checkbox(
                                  checkColor: Colors.white,
                                  side: BorderSide(
                                      width: 01, color: Colors.black),
                                  activeColor: Colors.red.shade500,
                                  value: _.checkbox13.value,
                                  onChanged: (bool? v) {
                                    _.checkbox13.value = v ?? false;
                                  },
                                ),
                              ),
                            ),
                            Text(
                              'Other',
                              style: TextStyle(
                                  fontSize: Get.width * .03,
                                  fontWeight: FontWeight.bold),
                            ).paddingSymmetric(horizontal: Get.width * .03),
                          ],
                        ).paddingSymmetric(horizontal: Get.width * .01),
                        //
                        SizedBox(
                          height: Get.height * .04,
                        ),
                      ],
                    ).paddingSymmetric(horizontal: Get.width * .02),
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

                    SizedBox(
                      height: Get.height * .02,
                    )
                  ],
                ),
              ),
            ).marginSymmetric(horizontal: Get.width * 0.02),
          )),
    );
  }
}

// 


