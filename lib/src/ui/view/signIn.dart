// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:hbb/src/controllers/iconController.dart';
import 'package:hbb/src/controllers/signinController.dart';
import 'package:hbb/src/ui/widgets/commonClasses.dart';
import 'package:hbb/src/utils/routes/routes.dart';
import 'package:hbb/src/utils/uidata/color.dart';
import 'package:hbb/src/utils/uidata/container_decor.dart';
import 'package:hbb/src/utils/uidata/text_styles.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final SignInController _ = Get.put(SignInController());
  final IconController iconController = Get.find();
  // final SignInService _ = Get.put(SignInService());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          height: Get.height,
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
              ),

              // BackgroundContainer
              Container(
                width: Get.width / 1.1,
                // height: 550,
                decoration: UIDataDecoration.boxdecor,
                child: Column(
                  children: [
                    const Text(
                      'Sign In',
                      style: UIDataTextStyles.HeadingStyle,
                    ).paddingOnly(top: 30, bottom: 20),

                    // Email/Username TextField
                    CustomTextField(
                      heading: 'Email/Username',
                      width: Get.width / 1.5,
                      controller: _.emailUsername,
                      hintText: 'Email/Username',
                    ),

                    // PhoneNumber TextField
                    Container(
                      width: Get.width / 1.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(18, 18, 18, 18)
                                  .withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(3, 3),
                            ),
                          ]),
                      child: Obx(
                        () => TextFormField(
                          textAlign: TextAlign.center,
                          controller: _.password,
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
                                fontSize: 16.0, fontWeight: FontWeight.w400),
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
                    ).paddingSymmetric(vertical: Get.height * 0.04),

                    // SignIn Button
                    Obx(
                      () => _.loaderCheck.value
                          ? CircularProgressIndicator()
                          : FillButton(
                              ontap: () async {
                                await _.login();
                                if (iconController.currentRoute !=
                                    Routes.home) {
                                  Get.offAllNamed(Routes.home);
                                }
                                iconController.currentRoute == Routes.home;
                              },
                              color: UIDataColors.commonColor,
                              width: Get.width / 1.5,
                              child: const Text(
                                'SIGN IN',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: () {},
                            child: const Text(
                              'Forgot Password',
                              style: TextStyle(fontSize: 16),
                            )),
                        Container(
                          width: 1.5,
                          height: 14,
                          color: Colors.black,
                        ).paddingSymmetric(horizontal: 10),
                        InkWell(
                            onTap: () {},
                            child: const Text(
                              'OTP LOGIN',
                              style: TextStyle(fontSize: 16),
                            )),
                      ],
                    ).paddingOnly(top: 30),
                    const Text(
                      'Or Sign In with',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ).paddingOnly(top: 20, bottom: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FillButton(
                          width: Get.width / 5,
                          color: Colors.black,
                          child: Image.asset(
                            'assets/images/fb.png',
                            fit: BoxFit.contain,
                          ),
                        ).paddingOnly(right: 20),
                        FillButton(
                          width: Get.width / 5,
                          color: Colors.black,
                          child: Image.asset(
                            'assets/images/gmail.png',
                            fit: BoxFit.contain,
                          ),
                        ) 
                      ],
                    ).paddingOnly(bottom: 30)
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
                        Get.toNamed(Routes.signup);
                      },
                      child: const Text(
                        'SIGN UP',
                        style: TextStyle(
                          fontSize: 20,
                          color: UIDataColors.commonColor,
                        ),
                      ))).paddingOnly(top: 30),

              const Text(
                'login as a guest user',
                style: TextStyle(color: UIDataColors.commonColor, fontSize: 20),
              ).paddingOnly(top: 15)
            ],
          ),
        ),
      ),
    );
  }
}
