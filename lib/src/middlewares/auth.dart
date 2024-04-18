import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hbb/src/utils/routes/routes.dart';

class AuthMiddleware extends GetMiddleware {
  // ignore: non_constant_identifier_names
  final Priority = 0;
  GetStorage box = GetStorage();

  @override
  RouteSettings? redirect(route) {
    return box.read('success') != null
        ? null
        : RouteSettings(name: Routes.login);
  }
}
