// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hbb/src/controllers/loginController.dart';
import 'package:hbb/src/ui/widgets/commonClasses.dart';
import 'package:hbb/src/utils/routes/routes.dart';
import 'package:hbb/src/utils/uidata/color.dart';
import 'package:hbb/src/utils/uidata/container_decor.dart';
import 'package:hbb/src/utils/uidata/text_styles.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});

  RxBool istrue = true.obs;
  final LogInController _ = Get.put(LogInController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: Get.width,
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
                        'Log In',
                        style: UIDataTextStyles.HeadingStyle,
                      ).paddingOnly(top: 30, bottom: 20),

                      // CountryCode TextField
                      // CustomTextField(
                      //   width: Get.width/1.5,
                      //   controller: _.countryCode,
                      // hintText: 'US (+1)',
                      // prefixIcon: Icons.person
                      // ),

                      // CountryCode and PhoneTextField
                      Obx(
                        () => CustomPhoneField(
                          width: Get.width / 1.5,
                          initialValue: _.phoneNumber.value,
                          controller: _.phonenumber,
                          hintText: 'Enter Phone Number',
                          ontap: (PhoneNumber number) {
                            if (_.phonenumber.text.length >= 10) {
                              _.phoneNumber.value = number;
                              istrue.value = true;
                            } else {
                              istrue.value = false;
                            }
                          },
                        ).paddingOnly(top: 20),
                      ),
                      Obx(() => istrue.value
                          ? const SizedBox()
                          : const Text(
                              'Enter a valid phone number',
                              style: TextStyle(color: Colors.red),
                            ).paddingOnly(top: 10)),

                      // NEXT Button
                      FillButton(
                        color: UIDataColors.commonColor,
                        width: Get.width / 1.5,
                        child: const Text(
                          'NEXT',
                          style: TextStyle(fontSize: 20),
                        ),
                      ).paddingOnly(top: Get.height * 0.04),
                      InkWell(
                          onTap: () {
                            Get.toNamed(Routes.signin);
                          },
                          child: const Text(
                            'LOGIN WITH EMAIL/ USERNAME',
                            style: TextStyle(fontSize: 16),
                          ).paddingOnly(top: 30)),
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
                            // height: 60,
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

                // Sign UP Button
                OutlineButton(
                    ontap: () {
                      Get.toNamed(Routes.signup);
                    },
                    width: Get.width / 1.5,
                    color: null,
                    border: Border.all(
                      width: 2,
                      color: UIDataColors.commonColor,
                    ),
                    child: const Text(
                      'SIGN UP',
                      style: TextStyle(
                        fontSize: 20,
                        color: UIDataColors.commonColor,
                      ),
                    )).paddingOnly(top: 30),

                const Text(
                  'login as a guest user',
                  style:
                      TextStyle(color: UIDataColors.commonColor, fontSize: 20),
                ).paddingOnly(top: 15)
              ],
            ),
          ).paddingSymmetric(vertical: 20),
        ),
      ),
    );
  }
}
