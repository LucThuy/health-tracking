import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_tracking/features/dashboard/components/food_card.dart';
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
                                                          onTap: () => {controller.detailLine(index)},
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
                                                          style: GoogleFonts.pangolin(
                                                            color: kWhite,
                                                            fontWeight: FontWeight.w700,
                                                            fontSize: 10.sp,
                                                          ),
                                                        ),
                                                        Text(
                                                          controller.todayPage
                                                              .value!.calories
                                                              .toString(),
                                                          style: GoogleFonts.pangolin(
                                                            color: kWhite,
                                                            fontWeight: FontWeight.w700,
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
                                                          style: GoogleFonts.pangolin(
                                                            color: kWhite,
                                                            fontWeight: FontWeight.w700,
                                                            fontSize: 10.sp,
                                                          ),
                                                        ),
                                                        Text(
                                                          controller.todayPage
                                                              .value!.protein
                                                              .toString(),
                                                          style: GoogleFonts.pangolin(
                                                            color: kWhite,
                                                            fontWeight: FontWeight.w700,
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
                                                          style: GoogleFonts.pangolin(
                                                            color: kWhite,
                                                            fontWeight: FontWeight.w700,
                                                            fontSize: 10.sp,
                                                          ),
                                                        ),
                                                        Text(
                                                          controller
                                                              .todayPage
                                                              .value!
                                                              .carbohydrates
                                                              .toString(),
                                                          style: GoogleFonts.pangolin(
                                                            color: kWhite,
                                                            fontWeight: FontWeight.w700,
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
                                                          style: GoogleFonts.pangolin(
                                                            color: kWhite,
                                                            fontWeight: FontWeight.w700,
                                                            fontSize: 10.sp,
                                                          ),
                                                        ),
                                                        Text(
                                                          controller.todayPage
                                                              .value!.fat
                                                              .toString(),
                                                          style: GoogleFonts.pangolin(
                                                            color: kWhite,
                                                            fontWeight: FontWeight.w700,
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
                            height: 35.h,
                            width: 100.w,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
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
}
