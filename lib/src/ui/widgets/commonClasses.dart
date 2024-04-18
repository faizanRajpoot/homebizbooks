import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final heading;
  final width;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final label;
  final keyboard;
  final ImageProvider<Object>? prefixIconImage;

  const CustomTextField(
      {super.key,
      this.width,
      this.label,
      this.keyboard,
     required this.heading,
      required this.controller,
      required this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.prefixIconImage});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w200),
        ).paddingOnly(bottom: 5, left: Get.width * 0.05),
        Container(
            width: width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color:
                        const Color.fromARGB(18, 18, 18, 18).withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(3, 3),
                  ),
                ]),
            child: TextFormField(
              textAlign: TextAlign.center,
              controller: controller,
              inputFormatters: keyboard,
              decoration: InputDecoration(
                prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
                suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
                hintText: hintText,
                contentPadding: EdgeInsets.symmetric(
                  vertical: Get.height * 0.015,
                ),
                fillColor: Colors.white,
                filled: true,
                hintStyle: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.w400),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(color: Colors.white, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(color: Colors.white, width: 1.0),
                ),
              ),
            )),
      ],
    );
  }
}

class FillButton extends StatelessWidget {
  final color;
  final width;
  final child;
  final ontap;

  FillButton(
      {super.key, required this.color, this.ontap, this.width, this.child});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: Get.height * 0.06,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(18, 18, 18, 18).withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(3, 3),
              ),
            ]),
        child: child,
      ),
    );
  }
}

class OutlineButton extends StatelessWidget {
  final color;
  final width;
  final child;
  final border;
  final ontap;

  const OutlineButton(
      {super.key,
      required this.color,
      required this.border,
      this.ontap,
      this.width,
      this.child});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: Get.height * 0.06,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            border: border,
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(18, 18, 18, 18).withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(3, 3),
              ),
            ]),
        child: child,
      ),
    );
  }
}

class HeightFillButton extends StatelessWidget {
  final Color color;
  final double width;
  final double height;
  final Widget child;

  HeightFillButton(
      {super.key,
      required this.color,
      required this.width,
      required this.height,
      required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(18, 18, 18, 18).withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(3, 3),
            ),
          ]),
      child: child,
    );
  }
}

class BottomNavContainer extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;

  const BottomNavContainer({
    super.key,
    required this.height,
    required this.width,
    required this.child,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        width: height,
        height: width,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 243, 239, 239),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(18, 18, 18, 18).withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(4, 4),
              ),
            ]),
        child: child);
  }
}

class CustomPhoneField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final width;
  final ontap;
  final initialValue;
  const CustomPhoneField({
    super.key,
    this.width,
    required this.initialValue,
    required this.controller,
    required this.hintText,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(18, 18, 18, 18).withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(3, 3),
            ),
          ]),
      child: InternationalPhoneNumberInput(
        onInputChanged: ontap,
        inputDecoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: Get.height * 0.02),
            hintText: hintText,
            border: const OutlineInputBorder(borderSide: BorderSide.none)),
        selectorConfig: const SelectorConfig(
            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
            showFlags: true,
            setSelectorButtonAsPrefixIcon: true,
            leadingPadding: Checkbox.width),
        ignoreBlank: false,
        autoValidateMode: AutovalidateMode.disabled,
        selectorTextStyle: const TextStyle(color: Colors.black),
        initialValue: initialValue,
        textFieldController: controller,
        formatInput: false,
        keyboardType:
            const TextInputType.numberWithOptions(signed: true, decimal: true),
        inputBorder: const OutlineInputBorder(),
        onInputValidated: (bool value) {
          // Handle validation
        },
      ),
    );
  }
}

class GoalsTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final heading;
  final readonly;
  final keyboard;

  final TextEditingController? seccontroller;
  final sechintText;
  final secheading;
  final secreadonly;
  final seckeyboard;

  final TextEditingController? thirdcontroller;
  final thirdhintText;
  final thirdheading;
  final thirdreadonly;
  final thirdkeyboard;
  final width;
  final secondwidth;
  final thirdwidth;

  const GoalsTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.heading,
    this.readonly,
    this.keyboard,
    this.seccontroller,
    this.sechintText,
    this.secheading,
    this.secreadonly,
    this.seckeyboard,
    this.thirdcontroller,
    this.thirdhintText,
    this.thirdheading,
    this.thirdreadonly,
    this.thirdkeyboard,
    this.width,
    this.secondwidth,
    this.thirdwidth,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // First
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              heading,
              style: TextStyle(
                  fontSize: Get.width * .025, fontWeight: FontWeight.bold),
            ),
            Container(
              // width: Get.width / 4,
              width: width,
              height: Get.height * .04,
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: TextField(
                readOnly: readonly,
                // keyboardType: TextInputType.number,
                inputFormatters: keyboard,
                controller: controller,
                style: TextStyle(
                  fontSize: Get.width * .025,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.black),
                  hintText: hintText,
                ),
              ).paddingSymmetric(horizontal: Get.width * .01),
            )
          ],
        ),
        // Second
        seccontroller != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    secheading,
                    style: TextStyle(
                        fontSize: Get.width * .025,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: secondwidth,
                    height: Get.height * .04,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: TextField(
                      controller: seccontroller,
                      inputFormatters: seckeyboard,
                      readOnly: secreadonly,
                      style: TextStyle(
                        fontSize: Get.width * .025,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.black),
                        hintText: sechintText,
                      ),
                    ).paddingSymmetric(horizontal: Get.width * .01),
                  )
                ],
              )
            : SizedBox(),
        // Third
        thirdcontroller != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    thirdheading,
                    style: TextStyle(
                        fontSize: Get.width * .025,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: thirdwidth,
                    height: Get.height * .04,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: TextField(
                      readOnly: thirdreadonly,
                      controller: thirdcontroller,
                      inputFormatters: thirdkeyboard,
                      style: TextStyle(
                        fontSize: Get.width * .025,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.black),
                        hintText: thirdhintText,
                        // text
                      ),
                    ).paddingSymmetric(horizontal: Get.width * .01),
                  )
                ],
              )
            : SizedBox()
      ],
    ).paddingSymmetric(horizontal: Get.width * .02);
  }
}


// class CheckboxClass extends StatelessWidget {
//     final value;
//     final String text;
  

//   const CheckboxClass({
//     super.key,
//     required this.value,
//     required this.text,
   
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Obx(
//                               () => Container(
//                                 height: Get.height * .02,
//                                 width: Get.width * .03,
//                                 child: Checkbox(
//                                   checkColor: Colors.white,
//                                   side: BorderSide(
//                                       width: 01, color: Colors.black),
//                                   activeColor: Colors.red.shade500,
//                                   value: value,
//                                   onChanged: (bool? v) {
//                                     value = v ?? false;
//                                   },
//                                 ),
//                               ),
//                             ),
//                             Text(
//                               text,
//                               style: TextStyle(
//                                   fontSize: Get.width * .03,
//                                   fontWeight: FontWeight.bold),
//                             ).paddingSymmetric(horizontal: Get.width * .03),
//                           ],
//                         ).paddingSymmetric(horizontal: Get.width * .01);
//                         //
//   }
// }
