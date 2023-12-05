import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_tracking/features/dashboard/components/food_card.dart';
import 'package:health_tracking/features/dashboard/dashboard_controller.dart';
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
                padding: EdgeInsets.only(
                    top: 1.h, bottom: 1.h, left: 5.w, right: 5.w),
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: kBackgroundColor,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 0.5.h, bottom: 0.5.h, left: 3.w, right: 3.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Thứ hai, 22/11/2023",
                          style: GoogleFonts.openSans(
                            color: kTextInvertColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 14.sp,
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              FoodCard(),
                              FoodCard(),
                              Card(
                                color: kSubBackgroundColor,
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Container(
                                  height: 200,
                                  width: 100,
                                  child: InkWell(
                                    child: Center(
                                        child: Icon(
                                          Icons.add,
                                          size: 50,
                                          color: kTextInvertColor,
                                    )),
                                  ),
                                ),
                              )
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
    );
  }
}
