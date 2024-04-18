import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hbb/src/controllers/contactUsController.dart';
import 'package:hbb/src/utils/uidata/container_decor.dart';
import 'package:hbb/src/utils/uidata/text_styles.dart';

class ContactUsScreen extends StatelessWidget {
  final ContactUsController _ = Get.put(ContactUsController());

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
            child: Column(children: [
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
                    "Contact Us",
                    style: UIDataTextStyles.headingtextbold,
                  ).paddingSymmetric(horizontal: Get.width * 0.015),
                  Spacer(),
                  Ink(
                    decoration: ShapeDecoration(
                        shape: CircleBorder(),
                        color: Color.fromARGB(55, 158, 158, 158)),
                    child: IconButton(
                      icon: Icon(Icons.format_list_bulleted),
                      onPressed: () {
                        // Add your onPressed logic here
                      },
                    ),
                  ),
                ],
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(fontSize: Get.width * .06),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue, // Set your desired border color
                    ),
                  ),
                ),
              ).marginSymmetric(vertical: Get.height * 0.01),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Name',
                  hintStyle: TextStyle(fontSize: Get.width * .06),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue, // Set your desired border color
                    ),
                  ),
                ),
              ).marginSymmetric(vertical: Get.height * 0.01),
              TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Content',
                  hintStyle: TextStyle(fontSize: Get.width * .06),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue, // Set your desired border color
                    ),
                  ),
                ),
              ).marginOnly(top: Get.height * 0.01, bottom: Get.height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Obx(
                    () => Checkbox(
                      checkColor: Colors.white,
                      side: BorderSide(width: 01, color: Colors.black),
                      activeColor: Colors.red.shade500,
                      value: _.checkboxT.value,
                      onChanged: (bool? v) {
                        _.checkboxT.value = v ?? false;
                      },
                    ),
                  ),
                  Text('I would like to recieve the newsletter')
                ],
              ),
              Container(
                width: Get.width, // Set your desired width
                height: Get.height * .06, // Set your desired height

                decoration: BoxDecoration(
                    color: Colors.red.shade500,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Submit',
                    style: TextStyle(
                        color: Colors.white, fontSize: Get.width * .05),
                  ),
                ),
              ).marginOnly(top: Get.height * 0.01),
              Container(
                width: Get.width, // Set your desired width
                height: Get.height * .3, // Set your desired height

                decoration: UIDataDecoration.boxdecor,

                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Email:",
                          style: TextStyle(
                              fontSize: Get.width * .03, color: Colors.grey),
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Text(
                              "Home Biz Books, inc.",
                              style: TextStyle(
                                  fontSize: Get.width * .03,
                                  color: Colors.grey),
                            ).marginSymmetric(vertical: Get.height * 0.005),
                            Text(
                              "109 Saddlebrook Dr",
                              style: TextStyle(
                                  fontSize: Get.width * .03,
                                  color: Colors.grey),
                            ).marginSymmetric(vertical: Get.height * 0.005),
                            Text(
                              "Harrison City PA",
                              style: TextStyle(
                                  fontSize: Get.width * .03,
                                  color: Colors.grey),
                            ).marginSymmetric(vertical: Get.height * 0.005),
                          ],
                        )
                      ],
                    ).marginSymmetric(vertical: Get.height * 0.01),
                    Row(
                      children: [
                        Text(
                          "Phone:",
                          style: TextStyle(
                              fontSize: Get.width * .03, color: Colors.grey),
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "855-392-6657",
                              style: TextStyle(
                                  fontSize: Get.width * .03,
                                  color: Colors.grey),
                            ).marginSymmetric(vertical: Get.height * 0.005),
                            Text(
                              "855-EZBOOKS",
                              style: TextStyle(
                                  fontSize: Get.width * .03,
                                  color: Colors.grey),
                            ).marginSymmetric(vertical: Get.height * 0.005),
                            Text(
                              "Ext 800 - General Question/Training",
                              style: TextStyle(
                                  fontSize: Get.width * .03,
                                  color: Colors.grey),
                            ).marginSymmetric(vertical: Get.height * 0.005),
                            Text(
                              "Ext 802 - General Service/Sales",
                              style: TextStyle(
                                  fontSize: Get.width * .03,
                                  color: Colors.grey),
                            ).marginSymmetric(vertical: Get.height * 0.005),
                            Text(
                              "Ext 802 - General Service ",
                              style: TextStyle(
                                  fontSize: Get.width * .03,
                                  color: Colors.grey),
                            ).marginSymmetric(vertical: Get.height * 0.005),
                          ],
                        )
                      ],
                    ).marginSymmetric(vertical: Get.height * 0.01)
                  ],
                ).paddingSymmetric(
                  horizontal: Get.width * .02,
                ),
              ).marginSymmetric(vertical: Get.height * 0.02),
            ]),
          ),
        )
            .paddingSymmetric(vertical: Get.height * 0.01)
            .marginSymmetric(horizontal: Get.height * 0.03),
      ),
    );
  }
}
