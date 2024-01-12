import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_tracking/features/dashboard/components/food_card.dart';
import 'package:health_tracking/features/dashboard/dashboard_controller.dart';
import 'package:health_tracking/features/diary/components/calender.dart';
import 'package:health_tracking/routes/app_pages.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../utility/theme.dart';
import 'components/user_info.dart';

class DashboardScreen extends GetView<DashboardController> {
  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: const BoxDecoration(gradient: kGradientGreen50White),
            child: SafeArea(
              child: Obx(
                () => controller.isLoading.value
                    ? Text(
                        controller.formatter
                            .format(controller.currentDate.value),
                        style: GoogleFonts.pangolin(
                          color: kWhite,
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                        ),
                      )
                    : Column(
                        children: [
                          // Card(
                          //   child: UserAvatarWithName(
                          //     username: 'kiennguyen',
                          //     name: 'Nguyen Xuan Kien',
                          //   ),
                          //   color: kGreen600,
                          // ),
                          SizedBox(
                            height: 42.h,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Obx(
                                        () => Text(
                                          controller.formatter.format(
                                              controller.currentDate.value),
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
                                            onRefresh: () =>
                                                controller.loadLine(),
                                            child: Center(
                                              child: SizedBox(
                                                height: 220,
                                                child: ListView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: controller
                                                            .lineList.length +
                                                        1,
                                                    itemBuilder:
                                                        (context, index) {
                                                      if (index ==
                                                          controller.lineList
                                                              .length) {
                                                        return Card(
                                                          color: kGreen50o6,
                                                          elevation: 3,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                          child: SizedBox(
                                                            height: 210,
                                                            width: 150,
                                                            child: InkWell(
                                                              onTap: () => {
                                                                Get.offNamed(
                                                                    AppRoutes
                                                                        .rImage),
                                                                Get.until((route) =>
                                                                    route
                                                                        .isFirst),
                                                              },
                                                              child:
                                                                  const Center(
                                                                child: Icon(
                                                                  Icons
                                                                      .add_rounded,
                                                                  size: 80,
                                                                  color: kWhite,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      } else {
                                                        return InkWell(
                                                          onTap: () => {
                                                            controller
                                                                .detailLine(
                                                                    index)
                                                          },
                                                          child: FoodCard(
                                                              line: controller
                                                                  .lineList
                                                                  .elementAt(
                                                                      index)),
                                                        );
                                                      }
                                                    }),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Obx(
                                        () => Center(
                                          child: Card(
                                            color: Colors.transparent,
                                            elevation: 3,
                                            shadowColor: kGreen950,
                                            child: Container(
                                              height: 80,
                                              width: 50.w,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: kGreen50o6,
                                              ),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 20,
                                                    width: 150,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Calories",
                                                          style: GoogleFonts
                                                              .pangolin(
                                                            color: kWhite,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 10.sp,
                                                          ),
                                                        ),
                                                        Text(
                                                          controller.todayPage
                                                              .value!.calories
                                                              .toString(),
                                                          style: GoogleFonts
                                                              .pangolin(
                                                            color: kWhite,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 10.sp,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                    width: 150,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Protein",
                                                          style: GoogleFonts
                                                              .pangolin(
                                                            color: kWhite,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 10.sp,
                                                          ),
                                                        ),
                                                        Text(
                                                          controller.todayPage
                                                              .value!.protein
                                                              .toString(),
                                                          style: GoogleFonts
                                                              .pangolin(
                                                            color: kWhite,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 10.sp,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                    width: 150,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Carbohydrates",
                                                          style: GoogleFonts
                                                              .pangolin(
                                                            color: kWhite,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 10.sp,
                                                          ),
                                                        ),
                                                        Text(
                                                          controller
                                                              .todayPage
                                                              .value!
                                                              .carbohydrates
                                                              .toString(),
                                                          style: GoogleFonts
                                                              .pangolin(
                                                            color: kWhite,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 10.sp,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                    width: 150,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Fat",
                                                          style: GoogleFonts
                                                              .pangolin(
                                                            color: kWhite,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 10.sp,
                                                          ),
                                                        ),
                                                        Text(
                                                          controller.todayPage
                                                              .value!.fat
                                                              .toString(),
                                                          style: GoogleFonts
                                                              .pangolin(
                                                            color: kWhite,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 10.sp,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ), //card food
                          SizedBox(
                            width: 100.w,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Card(
                                elevation: 3,
                                color: kGreen600,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Obx(
                                  () => LineChartComponent(
                                    dayCaloriesList: controller.pageList
                                        .map((element) => DayCalories(
                                            index: 1,
                                            day: getWeekdayName(
                                                DateFormat('M/d/yyyy')
                                                    .parse(element.date)
                                                    .weekday),
                                            calories: element.calories))
                                        .toList(),
                                    userName: 'Kien',
                                    planningDayCaloriesList: controller.planList
                                        .map((element) => DayCalories(
                                            index: 1,
                                            day: getWeekdayName(
                                                element.date.weekday),
                                            calories: element.calories))
                                        .toList(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getWeekdayName(int weekday) {
    switch (weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return 'Invalid weekday';
    }
  }
}
// controller.pageList
//     .map((element) => DayCalories(
// index: 1,
// day: '2',
// calories: element.calories))
// .toList(),
// [
// DayCalories(index: 1, day: '2', calories: 100),
// DayCalories(index: 2, day: '3', calories: 200),
// DayCalories(index: 3, day: '4', calories: 300),
// DayCalories(index: 4, day: '5', calories: 200),
// DayCalories(index: 5, day: '6', calories: 700),
// ]
