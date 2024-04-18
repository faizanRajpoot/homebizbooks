import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hbb/src/utils/routes/routes.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 1),
      () {
        Get.offAndToNamed(Routes.home);
      },
    );

    return 
       Center(
        child: Image.asset(
          'assets/images/SplashScreen.png', height: Get.height,
          fit: BoxFit.fill,
        ),
       );
  }
}