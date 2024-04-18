// ignore_for_file: unused_field
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hbb/src/controllers/homeController.dart';
import 'package:hbb/src/ui/widgets/commonScaffold.dart';
import 'package:hbb/src/utils/routes/routes.dart';
import 'package:hbb/src/utils/uidata/color.dart';
import 'package:hbb/src/utils/uidata/text_styles.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeController _ = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      appbar: true,
      color: Colors.white,
      bodyData: body(),
      showDrawer: true,
    );
  }

  Widget body() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // width: Get.width,
              height: Get.height * 0.2,
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                  // color: Color.fromARGB(255, 47, 47, 47),
                  image: DecorationImage(
                      // opacity: 1,
                      image: AssetImage(
                        'assets/images/banner-img.png',
                      ),
                      fit: BoxFit.cover)),
              child: SizedBox(
                width: Get.width / 2,
                child: Text(
                  'TRACK YOUR BUSINESS, GROW YOUR BUSINESS',
                  style: UIDataTextStyles.commontextheadbold,
                ).marginOnly(left: 10),
              ),
            ).marginOnly(top: Get.height * 0.03),
        
            // Track Activity
            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: Get.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Track Activity",
                        style: UIDataTextStyles.subheadingtextbold,
                      ).marginSymmetric(vertical: Get.height * 0.02),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _.isDailyExposureClicked.value = true;
                                _.isConferenceCallClicked.value = false;
                                _.isNationalExposireClicked.value = false;
                                _.isSignUplClicked.value = false;
                                _.isWeeklyMeetingClicked.value = false;
                                _.isActivityClicked.value = false;
                                _.isStatisticsClicked.value = false;
                                _.isGoalsClicked.value = false;
                                _.isProfileClicked.value = false;
                                _.isCoachingClicked.value = false;
                                _.isIncomeClicked.value = false;
                                _.isTeamClicked.value = false;
                                _.isSContactClicked.value = false;
                                Get.toNamed(Routes.reports,
                                    arguments: '/api/daily-report');
                              },
                              child: Column(
                                children: [
                                  Obx(
                                    () => Container(
                                      alignment: Alignment.center,
                                      width: Get.width * 0.27,
                                      height: Get.height * 0.12,
                                      decoration: BoxDecoration(
                                        color: _.isDailyExposureClicked.value
                                            ? Colors.red.shade100
                                            : UIDataColors.greyColor,
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                          image: AssetImage(
                                            'assets/images/dailyexposure.png',
                                          ),
                                        ),
                                      ),
                                    ).marginOnly(right: Get.width * .01),
                                  ),
                                  Text(
                                    'Daily Exposure',
                                    style: UIDataTextStyles.commontextbold,
                                  ).marginSymmetric(vertical: Get.height * .005)
                                ],
                              ).marginOnly(right: Get.width * .015),
                            ),
                            //
                            GestureDetector(
                              onTap: () {
                                _.isConferenceCallClicked.value = true;
                                _.isDailyExposureClicked.value = false;
                                _.isNationalExposireClicked.value = false;
                                _.isSignUplClicked.value = false;
                                _.isWeeklyMeetingClicked.value = false;
                                _.isActivityClicked.value = false;
                                _.isStatisticsClicked.value = false;
                                _.isGoalsClicked.value = false;
                                _.isProfileClicked.value = false;
                                _.isCoachingClicked.value = false;
                                _.isIncomeClicked.value = false;
                                _.isTeamClicked.value = false;
                                _.isSContactClicked.value = false;
                                Get.toNamed(Routes.reports,
                                    arguments: '/api/conference-report');
                              },
                              child: Column(
                                children: [
                                  Obx(
                                    () => Container(
                                      alignment: Alignment.center,
                                      width: Get.width * 0.27,
                                      height: Get.height * 0.12,
                                      decoration: BoxDecoration(
                                        color: _.isConferenceCallClicked.value
                                            ? Colors.red.shade100
                                            : UIDataColors.greyColor,
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                          image: AssetImage(
                                            'assets/images/conferencecall.png',
                                          ),
                                        ),
                                      ),
                                    ).marginOnly(right: Get.width * .01),
                                  ),
                                  Text(
                                    'Conference Call',
                                    style: UIDataTextStyles.commontextbold,
                                  ).marginSymmetric(vertical: Get.height * .005)
                                ],
                              ).marginOnly(right: Get.width * .015),
                            ),
                            //
                            GestureDetector(
                              onTap: () {
                                _.isWeeklyMeetingClicked.value = true;
                                _.isConferenceCallClicked.value = false;
                                _.isDailyExposureClicked.value = false;
                                _.isNationalExposireClicked.value = false;
                                _.isSignUplClicked.value = false;
                                _.isActivityClicked.value = false;
                                _.isStatisticsClicked.value = false;
                                _.isGoalsClicked.value = false;
                                _.isProfileClicked.value = false;
                                _.isCoachingClicked.value = false;
                                _.isIncomeClicked.value = false;
                                _.isTeamClicked.value = false;
                                _.isSContactClicked.value = false;
                                Get.toNamed(Routes.reports,
                                    arguments: '/api/weekly-report');
                              },
                              child: Column(
                                children: [
                                  Obx(
                                    () => Container(
                                      alignment: Alignment.center,
                                      width: Get.width * 0.27,
                                      height: Get.height * 0.12,
                                      decoration: BoxDecoration(
                                        color: _.isWeeklyMeetingClicked.value
                                            ? Colors.red.shade100
                                            : UIDataColors.greyColor,
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                          image: AssetImage(
                                            'assets/images/weeklymeeting.png',
                                          ),
                                        ),
                                      ),
                                    ).marginOnly(right: Get.width * .01),
                                  ),
                                  Text(
                                    'Weekly Meeting',
                                    style: UIDataTextStyles.commontextbold,
                                  ).marginSymmetric(vertical: Get.height * .005)
                                ],
                              ).marginOnly(right: Get.width * .015),
                            ),
                            //
                            GestureDetector(
                              onTap: () {
                                _.isNationalExposireClicked.value = true;
                                _.isWeeklyMeetingClicked.value = false;
                                _.isConferenceCallClicked.value = false;
                                _.isDailyExposureClicked.value = false;
                                _.isSignUplClicked.value = false;
                                _.isActivityClicked.value = false;
                                _.isStatisticsClicked.value = false;
                                _.isGoalsClicked.value = false;
                                _.isProfileClicked.value = false;
                                _.isCoachingClicked.value = false;
                                _.isIncomeClicked.value = false;
                                _.isTeamClicked.value = false;
                                _.isSContactClicked.value = false;
                                Get.toNamed(Routes.reports,
                                    arguments:
                                        '/api/national-international-report');
                              },
                              child: Column(
                                children: [
                                  Obx(
                                    () => Container(
                                      alignment: Alignment.center,
                                      width: Get.width * 0.27,
                                      height: Get.height * 0.12,
                                      decoration: BoxDecoration(
                                        color: _.isNationalExposireClicked.value
                                            ? Colors.red.shade100
                                            : UIDataColors.greyColor,
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                          image: AssetImage(
                                            'assets/images/weeklymeeting.png',
                                          ),
                                        ),
                                      ),
                                    ).marginOnly(right: Get.width * .01),
                                  ),
                                  Text(
                                    'National/International ',
                                    style: UIDataTextStyles.commontextbold,
                                  ).marginSymmetric(vertical: Get.height * .005)
                                ],
                              ).marginOnly(right: Get.width * .015),
                            ),
                            //
        
                            GestureDetector(
                              onTap: () {
                                _.isSignUplClicked.value = true;
                                _.isNationalExposireClicked.value = false;
                                _.isWeeklyMeetingClicked.value = false;
                                _.isConferenceCallClicked.value = false;
                                _.isDailyExposureClicked.value = false;
                                _.isActivityClicked.value = false;
                                _.isStatisticsClicked.value = false;
                                _.isGoalsClicked.value = false;
                                _.isProfileClicked.value = false;
                                _.isCoachingClicked.value = false;
                                _.isIncomeClicked.value = false;
                                _.isTeamClicked.value = false;
                                _.isSContactClicked.value = false;
                                Get.toNamed(Routes.reports,
                                    arguments: '/api/signup-type-report');
                              },
                              child: Column(
                                children: [
                                  Obx(
                                    () => Container(
                                      alignment: Alignment.center,
                                      width: Get.width * 0.27,
                                      height: Get.height * 0.12,
                                      decoration: BoxDecoration(
                                        color: _.isSignUplClicked.value
                                            ? Colors.red.shade100
                                            : UIDataColors.greyColor,
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                          image: AssetImage(
                                            'assets/images/signups.png',
                                          ),
                                        ),
                                      ),
                                    ).marginOnly(right: Get.width * .01),
                                  ),
                                  Text(
                                    'SignUp Reports',
                                    style: UIDataTextStyles.commontextbold,
                                  ).marginSymmetric(vertical: Get.height * .005)
                                ],
                              ).marginOnly(right: Get.width * .015),
                            ),
                            //
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //
                Container(
                  width: Get.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Service",
                        style: UIDataTextStyles.subheadingtextbold,
                      ).marginSymmetric(vertical: Get.height * .02),
        
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Activity
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _.isActivityClicked.value = true;
                                  _.isSignUplClicked.value = false;
                                  _.isNationalExposireClicked.value = false;
                                  _.isWeeklyMeetingClicked.value = false;
                                  _.isConferenceCallClicked.value = false;
                                  _.isDailyExposureClicked.value = false;
                                  _.isStatisticsClicked.value = false;
                                  _.isGoalsClicked.value = false;
                                  _.isProfileClicked.value = false;
                                  _.isCoachingClicked.value = false;
                                  _.isIncomeClicked.value = false;
                                  _.isTeamClicked.value = false;
                                  _.isSContactClicked.value = false;
                                  Get.toNamed(Routes.activity);
                                },
                                child: Obx(
                                  () => Container(
                                    alignment: Alignment.center,
                                    width: Get.width * 0.2,
                                    height: Get.height * 0.09,
                                    decoration: BoxDecoration(
                                      color: _.isActivityClicked.value
                                          ? Colors.red.shade100
                                          : UIDataColors.greyColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Icon(
                                      Icons.graphic_eq,
                                      size: Get.width * 0.07,
                                      color: Colors.red,
                                    ),
                                  ).marginOnly(right: Get.width * .01),
                                ),
                              ),
                              Text(
                                'Activity ',
                                style: UIDataTextStyles.commontextbold,
                              ).marginSymmetric(vertical: Get.height * .005)
                            ],
                          ),
                          // Statistics and Reports
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _.isStatisticsClicked.value = true;
                                  _.isActivityClicked.value = false;
                                  _.isSignUplClicked.value = false;
                                  _.isNationalExposireClicked.value = false;
                                  _.isWeeklyMeetingClicked.value = false;
                                  _.isConferenceCallClicked.value = false;
                                  _.isDailyExposureClicked.value = false;
                                  _.isGoalsClicked.value = false;
                                  _.isProfileClicked.value = false;
                                  _.isCoachingClicked.value = false;
                                  _.isIncomeClicked.value = false;
                                  _.isTeamClicked.value = false;
                                  _.isSContactClicked.value = false;
                                  Get.toNamed(Routes.reports);
                                },
                                child: Obx(
                                  () => Container(
                                    alignment: Alignment.center,
                                    width: Get.width * 0.2,
                                    height: Get.height * 0.09,
                                    decoration: BoxDecoration(
                                      color: _.isStatisticsClicked.value
                                          ? Colors.red.shade100
                                          : UIDataColors.greyColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Icon(
                                      Icons.bar_chart_sharp,
                                      size: Get.width * 0.07,
                                      color: Colors.red,
                                    ),
                                  ).marginOnly(right: Get.width * .01),
                                ),
                              ),
                              Text(
                                'Statistics',
                                style: UIDataTextStyles.commontextbold,
                              ).marginSymmetric(vertical: Get.height * .005)
                            ],
                          ),
        
                          //My Goals
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _.isGoalsClicked.value = true;
                                  _.isStatisticsClicked.value = false;
                                  _.isActivityClicked.value = false;
                                  _.isSignUplClicked.value = false;
                                  _.isNationalExposireClicked.value = false;
                                  _.isWeeklyMeetingClicked.value = false;
                                  _.isConferenceCallClicked.value = false;
                                  _.isDailyExposureClicked.value = false;
                                  _.isProfileClicked.value = false;
                                  _.isCoachingClicked.value = false;
                                  _.isIncomeClicked.value = false;
                                  _.isTeamClicked.value = false;
                                  _.isSContactClicked.value = false;
                                  Get.toNamed(Routes.mygoals);
                                },
                                child: Obx(
                                  () => Container(
                                    alignment: Alignment.center,
                                    width: Get.width * 0.2,
                                    height: Get.height * 0.09,
                                    decoration: BoxDecoration(
                                      color: _.isGoalsClicked.value
                                          ? Colors.red.shade100
                                          : UIDataColors.greyColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Icon(
                                      Icons.golf_course,
                                      size: Get.width * 0.07,
                                      color: Colors.red,
                                    ),
                                  ).marginOnly(right: Get.width * .01),
                                ),
                              ),
                              Text(
                                'My Goals',
                                style: UIDataTextStyles.commontextbold,
                              ).marginSymmetric(vertical: Get.height * .005)
                            ],
                          ),
        
                          //Profile
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _.isProfileClicked.value = true;
                                  _.isGoalsClicked.value = false;
                                  _.isStatisticsClicked.value = false;
                                  _.isActivityClicked.value = false;
                                  _.isSignUplClicked.value = false;
                                  _.isNationalExposireClicked.value = false;
                                  _.isWeeklyMeetingClicked.value = false;
                                  _.isConferenceCallClicked.value = false;
                                  _.isDailyExposureClicked.value = false;
                                  _.isCoachingClicked.value = false;
                                  _.isIncomeClicked.value = false;
                                  _.isTeamClicked.value = false;
                                  _.isSContactClicked.value = false;
                                  Get.toNamed(Routes.profile);
                                },
                                child: Obx(
                                  () => Container(
                                    alignment: Alignment.center,
                                    width: Get.width * 0.2,
                                    height: Get.height * 0.09,
                                    decoration: BoxDecoration(
                                      color: _.isProfileClicked.value
                                          ? Colors.red.shade100
                                          : UIDataColors.greyColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Icon(
                                      Icons.account_circle_outlined,
                                      size: Get.width * 0.07,
                                      color: Colors.red,
                                    ),
                                  ).marginOnly(right: Get.width * .01),
                                ),
                              ),
                              Text(
                                'Profile',
                                style: UIDataTextStyles.commontextbold,
                              ).marginSymmetric(vertical: Get.height * .005)
                            ],
                          ),
                          //
                        ],
                      ),
                      //
                      SizedBox(
                        height: Get.height * .02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Coaching Network
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _.isCoachingClicked.value = true;
                                  _.isProfileClicked.value = false;
                                  _.isGoalsClicked.value = false;
                                  _.isStatisticsClicked.value = false;
                                  _.isActivityClicked.value = false;
                                  _.isSignUplClicked.value = false;
                                  _.isNationalExposireClicked.value = false;
                                  _.isWeeklyMeetingClicked.value = false;
                                  _.isConferenceCallClicked.value = false;
                                  _.isDailyExposureClicked.value = false;
                                  _.isIncomeClicked.value = false;
                                  _.isTeamClicked.value = false;
                                  _.isSContactClicked.value = false;
                                  Get.toNamed(Routes.coachnetwork);
                                },
                                child: Obx(
                                  () => Container(
                                    alignment: Alignment.center,
                                    width: Get.width * 0.2,
                                    height: Get.height * 0.09,
                                    decoration: BoxDecoration(
                                      color: _.isCoachingClicked.value
                                          ? Colors.red.shade100
                                          : UIDataColors.greyColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Icon(
                                      Icons.category_rounded,
                                      size: Get.width * 0.07,
                                      color: Colors.red,
                                    ),
                                  ).marginOnly(right: Get.width * .01),
                                ),
                              ),
                              Text(
                                'My Coaching \nNetwork',
                                textAlign: TextAlign.center,
                                style: UIDataTextStyles.commontextbold,
                              ).marginSymmetric(vertical: Get.height * .005)
                            ],
                          ),
        
                          // Income and Expense
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _.isIncomeClicked.value = true;
                                  _.isCoachingClicked.value = false;
                                  _.isProfileClicked.value = false;
                                  _.isGoalsClicked.value = false;
                                  _.isStatisticsClicked.value = false;
                                  _.isActivityClicked.value = false;
                                  _.isSignUplClicked.value = false;
                                  _.isNationalExposireClicked.value = false;
                                  _.isWeeklyMeetingClicked.value = false;
                                  _.isConferenceCallClicked.value = false;
                                  _.isDailyExposureClicked.value = false;
                                  _.isTeamClicked.value = false;
                                  _.isSContactClicked.value = false;
                                  Get.toNamed(Routes.incomeexpense);
                                },
                                child: Obx(
                                  () => Container(
                                    alignment: Alignment.center,
                                    width: Get.width * 0.2,
                                    height: Get.height * 0.09,
                                    decoration: BoxDecoration(
                                      color: _.isIncomeClicked.value
                                          ? Colors.red.shade100
                                          : UIDataColors.greyColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Icon(
                                      Icons.wallet_outlined,
                                      size: Get.width * 0.07,
                                      color: Colors.red,
                                    ),
                                  ).marginOnly(right: Get.width * .01),
                                ),
                              ),
                              Text(
                                'My Income \nAnd Expenses',
                                textAlign: TextAlign.center,
                                style: UIDataTextStyles.commontextbold,
                              ).marginSymmetric(vertical: Get.height * .005)
                            ],
                          ),
        
                          // Support Team
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _.isTeamClicked.value = true;
                                  _.isIncomeClicked.value = false;
                                  _.isCoachingClicked.value = false;
                                  _.isProfileClicked.value = false;
                                  _.isGoalsClicked.value = false;
                                  _.isStatisticsClicked.value = false;
                                  _.isActivityClicked.value = false;
                                  _.isSignUplClicked.value = false;
                                  _.isNationalExposireClicked.value = false;
                                  _.isWeeklyMeetingClicked.value = false;
                                  _.isConferenceCallClicked.value = false;
                                  _.isDailyExposureClicked.value = false;
                                  _.isSContactClicked.value = false;
                                  Get.toNamed(Routes.supportteam);
                                },
                                child: Obx(
                                  () => Container(
                                    alignment: Alignment.center,
                                    width: Get.width * 0.2,
                                    height: Get.height * 0.09,
                                    decoration: BoxDecoration(
                                      color: _.isTeamClicked.value
                                          ? Colors.red.shade100
                                          : UIDataColors.greyColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Icon(
                                      Icons.support_agent,
                                      size: Get.width * 0.07,
                                      color: Colors.red,
                                    ),
                                  ).marginOnly(right: Get.width * .01),
                                ),
                              ),
                              Text(
                                'My Team \nSupport',
                                textAlign: TextAlign.center,
                                style: UIDataTextStyles.commontextbold,
                              ).marginSymmetric(vertical: Get.height * .005)
                            ],
                          ),
        
                          // Contact List
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _.isSContactClicked.value = true;
                                  _.isTeamClicked.value = false;
                                  _.isIncomeClicked.value = false;
                                  _.isCoachingClicked.value = false;
                                  _.isProfileClicked.value = false;
                                  _.isGoalsClicked.value = false;
                                  _.isStatisticsClicked.value = false;
                                  _.isActivityClicked.value = false;
                                  _.isSignUplClicked.value = false;
                                  _.isNationalExposireClicked.value = false;
                                  _.isWeeklyMeetingClicked.value = false;
                                  _.isConferenceCallClicked.value = false;
                                  _.isDailyExposureClicked.value = false;
                                  Get.toNamed(Routes.contactlist);
                                },
                                child: Obx(
                                  () => Container(
                                    alignment: Alignment.center,
                                    width: Get.width * 0.2,
                                    height: Get.height * 0.09,
                                    decoration: BoxDecoration(
                                      color: _.isSContactClicked.value
                                          ? Colors.red.shade100
                                          : UIDataColors.greyColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Icon(
                                      Icons.menu_book_sharp,
                                      size: Get.width * 0.07,
                                      color: Colors.red,
                                    ),
                                  ).marginOnly(right: Get.width * .01),
                                ),
                              ),
                              Text(
                                'My Contact \nList',
                                textAlign: TextAlign.center,
                                style: UIDataTextStyles.commontextbold,
                              ).marginSymmetric(vertical: Get.height * .005)
                            ],
                          ),
                          //
                        ],
                      ),
                      //
                    ],
                  ),
                )
              ],
            ),
        
            // Service
          ],
        ).marginSymmetric(horizontal: Get.height * 0.02),
      ),
    );
  }
}
