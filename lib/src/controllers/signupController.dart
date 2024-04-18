import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hbb/src/utils/routes/routes.dart';
import 'package:http/http.dart' as http;

class SignUpController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController companynameController = TextEditingController();
  TextEditingController acodeController = TextEditingController();
  TextEditingController firstphonenumberController = TextEditingController();
  TextEditingController secondphonenumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool passwordVisibility = false.obs;
  RxBool chk = false.obs;
  RxBool signUpCheck = false.obs;

  void submitForm() async {
    final username = usernameController.text.trim();
    final firstname = firstnameController.text.trim();
    final lastname = lastnameController.text.trim();
    final email = emailController.text.trim();
    final companyname = companynameController.text.trim();
    final acode = acodeController.text.trim();
    final firstphonenumber = firstphonenumberController.text.trim();
    final secondphonenumber = secondphonenumberController.text.trim();
    final password = passwordController.text.trim();

    // Validation
    if (username.isEmpty ||
        firstname.isEmpty ||
        lastname.isEmpty ||
        email.isEmpty ||
        companyname.isEmpty ||
        acode.isEmpty ||
        firstphonenumber.isEmpty ||
        secondphonenumber.isEmpty ||
        password.isEmpty) {
      Get.snackbar('Error', 'All fields are required',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      signUpCheck.value = false;
      return;
    }
    if (username.length < 5) {
      Get.snackbar('Error', 'Username must contain 5-letters',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      signUpCheck.value = false;

      return;
    }
    if (firstphonenumber.length > 3) {
      Get.snackbar('Error', 'First Number Length too long Please dial 3-digits',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      signUpCheck.value = false;

      return;
    }
    if (acode.length > 3) {
      Get.snackbar('Error', 'A-code field required 3-digits',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      signUpCheck.value = false;

      return;
    }
    if (secondphonenumber.length > 3) {
      Get.snackbar(
          'Error', 'Second Number Length too long Please dial 3-digits',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      signUpCheck.value = false;

      return;
    }

    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(email)) {
      // Show an error message for invalid email format
      Get.snackbar('Error', 'Enter a valid email',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      signUpCheck.value = false;

      return;
    }

    String apiUrl = "http://18.232.88.126/api/auth/sign-up";

    try {
      var res = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'hbb_uname': username,
          'hbb_pword': password,
          'hbb_firstname': firstname,
          'hbb_lastname': lastname,
          'hbb_companyname': companyname,
          'hbb_email': email,
          'hbb_acode': acode,
          'hbb_phone1': firstphonenumber,
          'hbb_phone2': secondphonenumber,
          'stripe_cust_id': 'empty',
          // Add other key-value pairs as needed
        }),
      );
      if (res.statusCode == 200) {
        // Handle a successful response
        print('POST request successful: ${res.body}');

        Get.snackbar('Successfully', 'Your Account Has Been Created',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green[700],
            colorText: Colors.white);
        signUpCheck.value = false;

        usernameController.text = '';
        firstnameController.text = '';
        lastnameController.text = '';
        emailController.text = '';
        companynameController.text = '';
        acodeController.text = '';
        firstphonenumberController.text = '';
        secondphonenumberController.text = '';
        passwordController.text = '';

        Get.offAndToNamed(Routes.signin);
      } else {
        // Handle an error response
        print('POST request failed with status: ${res.body}');
        signUpCheck.value = false;
      }
    } catch (e) {
      print('Error during POST request: $e');
      signUpCheck.value = false;
    }
  }

}
