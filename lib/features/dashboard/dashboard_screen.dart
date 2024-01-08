import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_tracking/features/dashboard/components/food_card.dart';
import 'package:health_tracking/features/dashboard/components/username.dart';
import 'package:health_tracking/features/dashboard/dashboard_controller.dart';
import 'package:health_tracking/routes/app_pages.dart';
import 'package:sizer/sizer.dart';

import '../../utility/theme.dart';
import 'components/user_info.dart';

class DashboardScreen extends GetView<DashboardController> {
  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: const BoxDecoration(gradient: kGradientGreen50White),
          child: SafeArea(
            child: Column(
              children: [
                Card(
                  child: UserAvatarWithName(
                    username: 'kiennguyen',
                    name: 'Nguyen Xuan Kien',
                  ),
                  color: kGreen600,
                ),
                SizedBox(
                  height: 40.h,
                  width: 100.w,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kGreen800o9,
                        ),
                        padding: const EdgeInsets.only(
                            top: 3, bottom: 3, left: 5, right: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(
                              () => Text(
                                controller.formatter
                                    .format(controller.currentDate.value),
                                style: GoogleFonts.pangolin(
                                  color: kWhite,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                            // SingleChildScrollView(
                            //   scrollDirection: Axis.horizontal,
                            //   child:
                            Obx(
                              () => Expanded(
                                child: RefreshIndicator(
                                  onRefresh: () => controller.loadLine(),
                                  child: Center(
                                    child: SizedBox(
                                      height: 220,
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount:
                                              controller.lineList.length + 1,
                                          itemBuilder: (context, index) {
                                            if (index ==
                                                controller.lineList.length) {
                                              return Card(
                                                color: kGreen50o6,
                                                elevation: 5,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: SizedBox(
                                                  height: 210,
                                                  width: 150,
                                                  child: InkWell(
                                                    onTap: () => Get.toNamed(
                                                        AppRoutes.rImage),
                                                    child: const Center(
                                                      child: Icon(
                                                        Icons.add_rounded,
                                                        size: 80,
                                                        color: kWhite,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            } else {
                                              return FoodCard(
                                                  line: controller.lineList
                                                      .elementAt(index));
                                            }
                                          }),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // ),
                            Row(
                              children: [
                                Container(
                                  padding: kMainPadding,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    color: kBackgroundMainColor,
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.accessibility,
                                        size: 20,
                                        color: kTextInvertColor,
                                      ),
                                      Text(
                                        "100/1000 kcal",
                                        style: GoogleFonts.openSans(
                                          color: kTextInvertColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 10.sp,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ), //card food
                SizedBox(
                    height: 35.h,
                    width: 100.w,
                    child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Card(
                          elevation: 3,
                          color: kGreen400,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: LineChartComponent(
                            dayCaloriesList: controller.pageList
                                .map((element) => DayCalories(
                                    index: 1,
                                    day: element.date.toString(),
                                    calories: element.calories))
                                .toList(),
                            userName: 'Kien',
                          ),
                        )))
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
