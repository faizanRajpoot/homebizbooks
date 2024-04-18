import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hbb/src/app.dart';

void main() {
  GetStorage.init();
  runApp(MyApp());
}

Future<void> initializeServices() async {
  // await Firebase.initializeApp();

  // SettingsService settings = SettingsService();
  // Get.putAsync(() => settings.init());
}
