// part of uidata;

// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hbb/src/utils/uidata/color.dart';

class UIDataTextStyles {
  // < ------------------------------------- Define Text Styling Here ----------------------->
  static const kViewAllStyle = TextStyle(
    fontSize: 25,
    fontFamily: 'Futurahi',
    fontWeight: FontWeight.w900,
    color: Color(0xff839ba3),
  );
  static const HeadingStyle = TextStyle(
    fontWeight: FontWeight.w700,
    fontFamily: 'Roboto',
    color: Colors.black,
    decoration: TextDecoration.none,
    fontSize: 45,
  );

  static TextStyle commontext = TextStyle(
    // fontWeight: FontWeight.w300,
    fontFamily: 'Roboto',
    color: Colors.black,
    fontSize: Get.width * .027,
  );
  static TextStyle commontextgrey = TextStyle(
    // fontWeight: FontWeight.w300,
    fontFamily: 'Roboto',
    color: Colors.grey,
    fontSize: Get.width * .025,
  );
  static TextStyle commontextheadbold = TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: 'Roboto',
    color: Colors.black,
    fontSize: Get.width * .035,
  );

  static TextStyle commontextbold = TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: 'Roboto',
    color: Colors.black,
    fontSize: Get.width * .027,
  );

  static TextStyle headingtextbold = TextStyle(
    fontFamily: 'Roboto',
    color: Colors.black,
    fontSize: Get.width * 0.05,
    fontWeight: FontWeight.bold,
  );

  static TextStyle subheadingtextbold = TextStyle(
    fontFamily: 'Roboto',
    color: Colors.black,
    fontSize: Get.width * 0.045,
    fontWeight: FontWeight.bold,
  );

  static const BottomNavHoverStyle = TextStyle(
      color: UIDataColors.commonColor,
      fontWeight: FontWeight.w600,
      fontSize: 12);
  static const BottomNavStyle =
      TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 12);
}
