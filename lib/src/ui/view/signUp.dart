// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hbb/src/controllers/signupController.dart';
import 'package:hbb/src/ui/widgets/commonClasses.dart';
import 'package:hbb/src/utils/routes/routes.dart';
import 'package:hbb/src/utils/uidata/color.dart';
import 'package:hbb/src/utils/uidata/container_decor.dart';
import 'package:hbb/src/utils/uidata/text_styles.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final SignUpController _ = Get.find<SignUpController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          // height: Get.height,
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage('assets/images/vecright.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              SizedBox(
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.cover,
                ),
              ).paddingOnly(top: 10),

              // BackgroundContainer
              Container(
                width: Get.width / 1.1,
                // height: 550,
                decoration: UIDataDecoration.boxdecor,
                child: Column(
                  children: [
                    const Text(
                      'SignUp',
                      style: UIDataTextStyles.HeadingStyle,
                    ).paddingOnly(top: 30, bottom: 20),

                    Container(
                      height: Get.height / 2.5,
                      width: Get.width,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            // Username TextField
                            CustomTextField(
                                heading: 'Username',
                                width: Get.width / 1.5,
                                controller: _.usernameController,
                                hintText: 'Enter Username'),

                            // FirstName TextField
                            CustomTextField(
                                    heading: 'First Name',
                                    width: Get.width / 1.5,
                                    controller: _.firstnameController,
                                    hintText: 'Enter First Name')
                                .paddingSymmetric(vertical: Get.height * 0.04),

                            // LastName TextField
                            CustomTextField(
                                heading: 'Last Name',
                                width: Get.width / 1.5,
                                controller: _.lastnameController,
                                hintText: 'Enter Last Name'),

                            // Email TextField
                            CustomTextField(
                                    heading: 'Email',
                                    width: Get.width / 1.5,
                                    controller: _.emailController,
                                    hintText: 'Enter Email Address')
                                .paddingSymmetric(vertical: Get.height * 0.04),

                            // Compnay Name TextField
                            CustomTextField(
                                heading: 'Company Name',
                                width: Get.width / 1.5,
                                controller: _.companynameController,
                                hintText: 'Company Name'),

                            // ACode TextField
                            CustomTextField(
                                    heading: 'A-code',
                                    keyboard: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    
                                    width: Get.width / 1.5,
                                    controller: _.acodeController,
                                    hintText: 'Enter A-code')
                                .paddingSymmetric(vertical: Get.height * 0.04),

                            // First phone mumbe TextField
                            CustomTextField(
                                heading: 'First Digits',
                                keyboard: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                width: Get.width / 1.5,
                                controller: _.firstphonenumberController,
                                hintText: 'First Phone Number'),
                            // Second phone number TextField
                            CustomTextField(
                                    heading: 'Last Digits',
                                    keyboard: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    width: Get.width / 1.5,
                                    controller: _.secondphonenumberController,
                                    hintText: 'Second Phone Number')
                                .paddingSymmetric(vertical: Get.height * 0.04),

                            // Password TextField
                            Container(
                              width: Get.width / 1.5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          const Color.fromARGB(18, 18, 18, 18)
                                              .withOpacity(0.1),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: const Offset(3, 3),
                                    ),
                                  ]),
                              child: Obx(
                                () => TextFormField(
                                  textAlign: TextAlign.center,
                                  controller: _.passwordController,
                                  obscureText: !_.passwordVisibility.value,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          _.passwordVisibility.toggle();
                                        },
                                        icon: Icon(
                                          _.passwordVisibility.value
                                              ? Icons.remove_red_eye_outlined
                                              : Icons.remove_red_eye,
                                        )),
                                    hintText: 'Enter Password',
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: Get.height * 0.015),
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintStyle: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: const BorderSide(
                                          color: Colors.white, width: 1.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: const BorderSide(
                                          color: Colors.white, width: 1.0),
                                    ),
                                  ),
                                ),
                              ),
                            ).paddingOnly(bottom: Get.height * 0.04),
                          ],
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Radio Button
                        InkWell(
                          onTap: () {
                            _.chk.value = !_.chk.value;
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: UIDataColors.commonColor,
                                ),
                                borderRadius: BorderRadius.circular(50)),
                            child: Obx(
                              () => Container(
                                decoration: BoxDecoration(
                                    color: _.chk.value
                                        ? UIDataColors.commonColor
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                width: 15,
                                height: 15,
                              ),
                            ),
                          ),
                        ).paddingOnly(right: 10),

                        const Text(
                          'I have read & agree to the terms & conditions',
                          style: TextStyle(
                              color: UIDataColors.commonColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ).paddingSymmetric(vertical: 15),
                    // Sign UP Button
                    Obx(() => _.signUpCheck.value
                        ? CircularProgressIndicator()
                            .marginSymmetric(vertical: 10)
                        : FillButton(
                            ontap: () {
                              _.signUpCheck.value = true;
                              _.submitForm();
                            },
                            color: UIDataColors.commonColor,
                            width: Get.width / 1.5,
                            child: const Text(
                              'SIGN UP',
                              style: TextStyle(fontSize: 20),
                            ),
                          ).paddingOnly(bottom: 40))
                  ],
                ),
              ).paddingOnly(top: 20),

              // Sign In Button
              OutlineButton(
                  width: Get.width / 1.5,
                  color: null,
                  border: Border.all(
                    width: 2,
                    color: UIDataColors.commonColor,
                  ),
                  child: InkWell(
                      onTap: () {
                        Get.offAllNamed(Routes.home);
                      },
                      child: const Text(
                        'SIGN IN',
                        style: TextStyle(
                          fontSize: 20,
                          color: UIDataColors.commonColor,
                        ),
                      ))).paddingOnly(top: 30)
            ],
          ),
        ),
      ),
    );
  }
}
