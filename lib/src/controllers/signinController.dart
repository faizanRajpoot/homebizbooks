// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class SignInController extends GetxController {
  TextEditingController emailUsername = TextEditingController();
  TextEditingController password = TextEditingController();
  GetStorage box = GetStorage();
  RxBool passwordVisibility = false.obs;
  RxBool loaderCheck = false.obs;
  var responseData;

  login() async {
    final username = emailUsername.text.trim();
    final pasword = password.text.trim();
    loaderCheck.value = true;

    if (username.isEmpty ||
        pasword.isEmpty) {
      Get.snackbar('Error', 'All fields are required',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    }
    String apiUrl = "http://18.232.88.126/api/auth/login";
    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        body: {"uname": emailUsername.text, "password": password.text},
      );

      if (response.statusCode == 200) {
        responseData = jsonDecode(response.body);
        loaderCheck.value = false;
        box.write('success', responseData['token']['accessToken']);
        box.write('uname', responseData['user']['uname']);
        box.write('ufullName', responseData['user']['fullName']);
        box.write('uId', responseData['user']['id']);
        box.write('uAddress', responseData['user']['address']);
        box.write('uEmail', responseData['user']['email']);
        box.write('uAcode', responseData['user']['phone1']);
        box.write('uPhone1', responseData['user']['phone2']);
        box.write('uPhone2', responseData['user']['phone3']);
      } else {
        loaderCheck.value = false;

        Get.snackbar('Error', 'Invalid username or password',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);

        print("Failed to post data. Status code: ${response.statusCode}");
      }
    } catch (error) {
      loaderCheck.value = false;
      print("Error posting data: $error");
    }
  }
}
