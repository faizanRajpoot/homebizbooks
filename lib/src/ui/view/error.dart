// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

// packages
import 'package:get/get.dart';
// import 'package:flutter_svg/svg.dart';

// widgets
// import '../../widgets/common_scaffold.dart';
// import '../../widgets/buttons/raised_button.dart';

// utils

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Text(
          'Something went wrong',
          style: TextStyle(
              fontSize: Get.width * 0.05,
              color: Colors.red.shade500,
              decoration: TextDecoration.none),
        ),
      ),
    );
  }
}
