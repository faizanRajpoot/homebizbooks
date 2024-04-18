import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../utils/routes/routes.dart';

// ignore: must_be_immutable
class MyDrawer extends StatelessWidget {
  GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: Get.width / 1.2,
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SafeArea(
            child: Container(
              height: Get.height,
              width: Get.width,
              // color: Colors.amber,
              child: Column(
                children: [
                  SizedBox(
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: Get.height * .12,
                    width: Get.width,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Colors.grey,
                          width: 0.2,
                        ),
                        bottom: BorderSide(
                          color: Colors.grey,
                          width: 0.2,
                        ),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: Get.height * .07,
                          width: Get.width * .2,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          ),
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/one.jpg'),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome',
                              style: TextStyle(
                                  fontSize: Get.width * .05,
                                  color: Colors.grey),
                            ),
                            Text(
                              '${box.read('uname')}',
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: Get.width * .03),
                            ),
                          ],
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.logout_outlined,
                            color: Colors.grey,
                            size: Get.width * 0.07,
                          ),
                        )
                      ],
                    ),
                  ).marginSymmetric(vertical: Get.height * 0.02),
                  //1
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.profile);
                    },
                    child: SizedBox(
                      height: Get.height * .08,
                      child: Row(
                        children: [
                          Container(
                            height: Get.height / 9,
                            width: Get.width / 9,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: Get.width * 0.06,
                            ),
                          ),
                          Text(
                            'Profile',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: Get.width * .035,
                            ),
                          ).marginSymmetric(horizontal: Get.width * .02),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.grey,
                              size: Get.width * 0.04,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //2
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.activity);
                    },
                    child: SizedBox(
                      height: Get.height * .08,
                      child: Row(
                        children: [
                          Container(
                            height: Get.height / 9,
                            width: Get.width / 9,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.white,
                              size: Get.width * 0.06,
                            ),
                          ),
                          Text(
                            'My Activity Calender',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: Get.width * .035,
                            ),
                          ).marginSymmetric(horizontal: Get.width * .02),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.grey,
                              size: Get.width * 0.04,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //3
                  SizedBox(
                    height: Get.height * .08,
                    child: Row(
                      children: [
                        Container(
                          height: Get.height / 9,
                          width: Get.width / 9,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.settings,
                            color: Colors.white,
                            size: Get.width * 0.06,
                          ),
                        ),
                        Text(
                          'Setting',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: Get.width * .035,
                          ),
                        ).marginSymmetric(horizontal: Get.width * .02),
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.grey,
                            size: Get.width * 0.04,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //4
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.reports);
                    },
                    child: SizedBox(
                      height: Get.height * .08,
                      child: Row(
                        children: [
                          Container(
                            height: Get.height / 9,
                            width: Get.width / 9,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.question_mark_outlined,
                              color: Colors.white,
                              size: Get.width * 0.06,
                            ),
                          ),
                          Text(
                            'Reports',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: Get.width * .035,
                            ),
                          ).marginSymmetric(horizontal: Get.width * .02),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.grey,
                              size: Get.width * 0.04,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //5
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.contactUs);
                    },
                    child: SizedBox(
                      height: Get.height * .08,
                      child: Row(
                        children: [
                          Container(
                            height: Get.height / 9,
                            width: Get.width / 9,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.person_4_outlined,
                              color: Colors.white,
                              size: Get.width * 0.06,
                            ),
                          ),
                          Text(
                            'Contact Us',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: Get.width * .035,
                            ),
                          ).marginSymmetric(horizontal: Get.width * .02),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.grey,
                              size: Get.width * 0.04,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //6
                  InkWell(
                    onTap: () {
                      Get.defaultDialog(
                        title: 'Log Out',
                        content: Text('Are you sure u want to log out?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () async {
                              await box.remove('success');
                              Get.offAllNamed(Routes.login);
                            },
                            child: Text('Log out'),
                          ),
                        ],
                      );
                    },
                    child: SizedBox(
                      height: Get.height * .08,
                      child: Row(
                        children: [
                          Container(
                            height: Get.height / 9,
                            width: Get.width / 9,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.logout,
                              color: Colors.white,
                              size: Get.width * 0.06,
                            ),
                          ),
                          Text(
                            'Logout',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: Get.width * .035,
                            ),
                          ).marginSymmetric(horizontal: Get.width * .02),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
                .paddingSymmetric(vertical: Get.height * 0.01)
                .marginSymmetric(horizontal: Get.height * 0.03),
          ),
        ],
      ),
    );
  }
}
