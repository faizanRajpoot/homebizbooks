import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class LogInController extends GetxController {
  TextEditingController phonenumber = TextEditingController();
  Rx<PhoneNumber> phoneNumber = PhoneNumber(isoCode: 'US').obs;
}
