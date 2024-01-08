import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../utility/theme.dart';

class FoodCardChoice extends StatelessWidget {
  const FoodCardChoice({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kGreen100,
      elevation: 3,
      shadowColor: kGreen950,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: SizedBox(
        width: 150,
        height: 210,
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
                child: Image.network(
                  "https://i1.sndcdn.com/avatars-rzk8K2FyGdgb7wdQ-VWh76w-t240x240.jpg",
                  fit: BoxFit.cover,
                  height: 140,
                  width: 140,
                ),
              ),
            ),
            SizedBox(
              height: 30,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  "Bus",
                  style: GoogleFonts.pangolin(
                    color: kGreen800,
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
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
