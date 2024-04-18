import 'package:flutter/material.dart';
import 'package:hbb/src/controllers/iconController.dart';
import 'package:hbb/src/ui/view/error.dart';
import 'package:hbb/src/utils/routes/appPages.dart';
import 'package:get/get.dart';


class MyApp extends StatelessWidget {
  MyApp({super.key});
  final IconController iconController = Get.put(IconController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // home: Scaffold(body: SplashScreen()),
      title: 'HomeBizBooks',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        // fontFamily: 'Popins',
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      onUnknownRoute: (RouteSettings rs) => MaterialPageRoute(
        builder: (context) {
          return ErrorView(
            // message: 'Coming Soon!',
          );
        },
      ),
    );
  }
}


