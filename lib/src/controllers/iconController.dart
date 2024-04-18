import 'package:get/get.dart';

class IconController extends GetxController {
  RxString currentRoute = ''.obs;

  void setCurrentRoute(String route) {
    currentRoute.value = route;
  }
}