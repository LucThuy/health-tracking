import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_tracking/features/dashboard/components/food_card.dart';
import 'package:health_tracking/features/dashboard/dashboard_controller.dart';
import 'package:health_tracking/routes/app_pages.dart';
import 'package:sizer/sizer.dart';

import '../../utility/theme.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
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
                      gradient: kBackgroundLinearMainSubColor,
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
                            style: GoogleFonts.openSans(
                              color: kTextInvertColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 14.sp,
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
                                      itemCount: controller.lineList.length + 1,
                                      itemBuilder: (context, index) {
                                        if (index ==
                                            controller.lineList.length) {
                                          return Card(
                                            color:
                                                kBackgroundTransparentSubZeroColor,
                                            elevation: 1,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: SizedBox(
                                              height: 210,
                                              width: 150,
                                              child: InkWell(
                                                onTap: () =>
                                                    Get.toNamed(AppRoutes.rCamera),
                                                child: const Center(
                                                  child: Icon(
                                                    Icons.add,
                                                    size: 80,
                                                    color: kTextInvertColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        } else {
                                          return FoodCard();
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
            ),
          ],
        ),
      ),
    );
  }
}
