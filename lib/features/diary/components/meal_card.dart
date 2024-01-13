import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_tracking/local/line/line.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../local/database/plan.dart';
import '../../../utility/theme.dart';

class MealCard extends StatelessWidget {
  final PlanData plan;
  final DateFormat timeFormatter = DateFormat('jm');

  MealCard({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kGreen50o6,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        padding: const EdgeInsets.only(top: 3, bottom: 3, left: 6, right: 6),
        height: 210,
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              shadowColor: kGreen950,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 150,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        Text(
                          plan.name.toString(),
                          style: GoogleFonts.pangolin(
                            color: kWhite,
                            fontWeight: FontWeight.w700,
                            fontSize: 15.sp,
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          height: 20,
                          width: 130,
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,
                            children: [
                              Text(
                                "Calories:",
                                style: GoogleFonts
                                    .pangolin(
                                  color: kWhite,
                                  fontWeight:
                                  FontWeight.w700,
                                  fontSize: 12.sp,
                                ),
                              ),
                              Text(
                                plan.calories
                                    .toString(),
                                style: GoogleFonts
                                    .pangolin(
                                  color: kWhite,
                                  fontWeight:
                                  FontWeight.w700,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          width: 130,
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,
                            children: [
                              Text(
                                "Protein:",
                                style: GoogleFonts
                                    .pangolin(
                                  color: kWhite,
                                  fontWeight:
                                  FontWeight.w700,
                                  fontSize: 12.sp,
                                ),
                              ),
                              Text(
                                plan.protein
                                    .toString(),
                                style: GoogleFonts
                                    .pangolin(
                                  color: kWhite,
                                  fontWeight:
                                  FontWeight.w700,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          width: 130,
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,
                            children: [
                              Text(
                                "Cacbohydrates:",
                                style: GoogleFonts
                                    .pangolin(
                                  color: kWhite,
                                  fontWeight:
                                  FontWeight.w700,
                                  fontSize: 12.sp,
                                ),
                              ),
                              Text(
                                plan.carbohydrates
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
                          width: 130,
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,
                            children: [
                              Text(
                                "Fat:",
                                style: GoogleFonts
                                    .pangolin(
                                  color: kWhite,
                                  fontWeight:
                                  FontWeight.w700,
                                  fontSize: 12.sp,
                                ),
                              ),
                              Text(
                                plan.fat
                                    .toString(),
                                style: GoogleFonts
                                    .pangolin(
                                  color: kWhite,
                                  fontWeight:
                                  FontWeight.w700,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
            Text(
              timeFormatter.format(plan.time),
              style: GoogleFonts.pangolin(
                color: kWhite,
                fontWeight: FontWeight.w700,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
