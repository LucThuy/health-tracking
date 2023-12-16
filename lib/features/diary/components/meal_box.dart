import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../utility/theme.dart';
import '../../dashboard/components/food_card.dart';

class MealBox extends StatelessWidget {
  const MealBox({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 36.h,
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
            child: Padding(
              padding: EdgeInsets.only(
                  top: 0.5.h, bottom: 0.5.h, left: 3.w, right: 3.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bữa ăn",
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
                        const FoodCard(),
                        const FoodCard(),
                        Card(
                          color: kBackgroundTransparentSubZeroColor,
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Container(
                            height: 200,
                            width: 100,
                            child: const InkWell(
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
    );
  }
}