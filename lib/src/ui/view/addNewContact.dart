import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hbb/src/controllers/addNewContactController.dart';
import 'package:hbb/src/controllers/contactlistController.dart';
import 'package:hbb/src/ui/widgets/commonClasses.dart';
import 'package:hbb/src/utils/uidata/color.dart';
import 'package:hbb/src/utils/uidata/text_styles.dart';

class AddNewContactScreen extends StatelessWidget {
  final AddNewContactController _ = Get.put(AddNewContactController());
  final ContactListController contactListController =
      Get.put(ContactListController());

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
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                          "Add New Contact",
                          textAlign: TextAlign.start,
                          style: UIDataTextStyles.headingtextbold,
                        ).paddingSymmetric(horizontal: Get.width * 0.015),
                      ],
                    ).marginSymmetric(
                        vertical: Get.height * 0.025,
                        horizontal: Get.width * .03),
                    //
                    Container(
                      color: UIDataColors.greyColor,
                      child: GoalsTextField(
                        width: Get.width / 1.09,
                        controller: _.name,
                        hintText: '',
                        readonly: false,
                        heading: "Name:",
                      ).paddingSymmetric(vertical: Get.width * .02),
                    ),
                    SizedBox(
                      height: Get.height * .01,
                    ),
                    GoalsTextField(
                      width: Get.width / 1.09,
                      controller: _.lastnam,
                      hintText: '',
                      readonly: false,
                      heading: "Last Name:",
                    ),
                    SizedBox(
                      height: Get.height * .01,
                    ),
                    Container(
                      color: UIDataColors.greyColor,
                      child: GoalsTextField(
                        width: Get.width / 1.09,
                        controller: _.phoneNo,
                        hintText: '',
                        readonly: false,
                        heading: "Phone:",
                      ).paddingSymmetric(vertical: Get.width * .02),
                    ),
                    SizedBox(
                      height: Get.height * .01,
                    ),
                    GoalsTextField(
                      width: Get.width / 1.09,
                      controller: _.emai,
                      hintText: '',
                      readonly: false,
                      heading: "Email:",
                    ),
                    SizedBox(
                      height: Get.height * .01,
                    ),
                    GoalsTextField(
                      width: Get.width / 1.09,
                      controller: _.addres,
                      hintText: '',
                      readonly: false,
                      heading: "Address:",
                    ),
                    SizedBox(
                      height: Get.height * .01,
                    ),
                    Container(
                      color: UIDataColors.greyColor,
                      child: GoalsTextField(
                        width: Get.width * .4,
                        controller: _.cit,
                        hintText: '',
                        readonly: false,
                        heading: "City:",
                        secondwidth: Get.width * .25,
                        secheading: "State:",
                        sechintText: "",
                        secreadonly: false,
                        seccontroller: _.stat,
                        thirdheading: 'Zip:',
                        thirdhintText: '',
                        thirdwidth: Get.width * .25,
                        thirdcontroller: _.zipp,
                        thirdreadonly: false,
                      ).paddingSymmetric(vertical: Get.width * .02),
                    ),
                    SizedBox(
                      height: Get.height * .01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Relation Level:",
                          style: TextStyle(
                              fontSize: Get.width * .025,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: Get.width * .6,
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
                                    vertical: Get.height * .01, horizontal: 10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      BorderSide(color: Colors.black, width: 1),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      BorderSide(color: Colors.black, width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  gapPadding: 0.0,
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      BorderSide(color: Colors.black, width: 1),
                                ),
                              ),
                              iconEnabledColor: Colors.black,
                              iconSize: Get.width * .04,
                              value: _.refValue,
                              items: const [
                                DropdownMenuItem<String>(
                                  value: '1',
                                  child: Text('1'),
                                ),
                                DropdownMenuItem<String>(
                                  value: '2',
                                  child: Text('2'),
                                ),
                                DropdownMenuItem<String>(
                                  value: '3',
                                  child: Text('3'),
                                ),
                                DropdownMenuItem<String>(
                                  value: '4',
                                  child: Text('4'),
                                ),
                                DropdownMenuItem<String>(
                                  value: '5',
                                  child: Text('5'),
                                ),
                                DropdownMenuItem<String>(
                                  value: '6',
                                  child: Text('6'),
                                ),
                                DropdownMenuItem<String>(
                                  value: '7',
                                  child: Text('7'),
                                ),
                                DropdownMenuItem<String>(
                                  value: '8',
                                  child: Text('8'),
                                ),
                                DropdownMenuItem<String>(
                                  value: '9',
                                  child: Text('9'),
                                ),
                                DropdownMenuItem<String>(
                                  value: '10',
                                  child: Text('10'),
                                ),
                              ],
                              onChanged: (value) {
                                _.refValue = value;
                              }),
                        ),
                      ],
                    ).marginSymmetric(horizontal: Get.width * .025),

                    //
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Red",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: Get.width * .025,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              " = 7-10 People you look up to",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: Get.width * .025,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),

                        //
                        Row(
                          children: [
                            Text(
                              "Green",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: Get.width * .025,
                                  color: Colors.green,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              " = 4-6 People who are you peers",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: Get.width * .025,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        //
                        Row(
                          children: [
                            Text(
                              "blue",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: Get.width * .025,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              " = 1-3 People who look up to you",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: Get.width * .025,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        //
                      ],
                    )
                        .marginSymmetric(
                            horizontal: Get.width * .025,
                            vertical: Get.height * .03)
                        .marginOnly(top: Get.height * .02),
                    Obx(
                      () => Row(
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
                          contactListController.isEdit.value
                              ? InkWell(
                                  onTap: () {
                                    _.upDate();
                                    // print('update');
                                  },
                                  child: Container(
                                    color: UIDataColors.commonColor,
                                    child: Text(
                                      'Update',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: Get.width * 0.035),
                                    ).marginSymmetric(
                                        horizontal: Get.width * 0.04,
                                        vertical: Get.height * 0.01),
                                  ).paddingSymmetric(horizontal: 10),
                                )
                              : InkWell(
                                  onTap: () {
                                    _.addContact();
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
                      ),
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


