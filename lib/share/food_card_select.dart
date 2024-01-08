import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_tracking/local/database/nutritions_database.dart';
import 'package:sizer/sizer.dart';

import '../utility/theme.dart';

class FoodCardChoice extends StatelessWidget {
  final NutritionData nutritionData;

  const FoodCardChoice({super.key, required this.nutritionData});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kGreen100,
      elevation: 3,
      shadowColor: kGreen950,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        width: 150,
        height: 210,
        padding: const EdgeInsets.all(3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              nutritionData.name,
              style: GoogleFonts.pangolin(
                color: kGreen800,
                fontWeight: FontWeight.w700,
                fontSize: 18.sp,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Calories",
                  style: GoogleFonts.pangolin(
                    color: kGreen800,
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp,
                  ),
                ),
                Text(
                  nutritionData.calories.toString(),
                  style: GoogleFonts.pangolin(
                    color: kGreen800,
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Protein",
                  style: GoogleFonts.pangolin(
                    color: kGreen800,
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp,
                  ),
                ),
                Text(
                  nutritionData.protein.toString(),
                  style: GoogleFonts.pangolin(
                    color: kGreen800,
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Carbohydrates",
                  style: GoogleFonts.pangolin(
                    color: kGreen800,
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp,
                  ),
                ),
                Text(
                  nutritionData.carbohydrates.toString(),
                  style: GoogleFonts.pangolin(
                    color: kGreen800,
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Fat",
                  style: GoogleFonts.pangolin(
                    color: kGreen800,
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp,
                  ),
                ),
                Text(
                  nutritionData.fat.toString(),
                  style: GoogleFonts.pangolin(
                    color: kGreen800,
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
