import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../utility/theme.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kSubBackgroundColor,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        padding: const EdgeInsets.only(top: 3, bottom: 3, left: 6, right: 6),
        height: 200,
        width: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: kObjectBackgroundColor,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  margin: const EdgeInsets.only(bottom: 3),
                  padding: const EdgeInsets.only(
                      top: 1, bottom: 1, left: 3, right: 3),
                  child: Text(
                    "10:30",
                    style: GoogleFonts.openSans(
                      color: kTextInvertColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 6.sp,
                    ),
                  ),
                ),
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child: Image.network(
                "https://i.pinimg.com/280x280_RS/f6/e9/3a/f6e93a06b500b2d87ffd32e1f56f7c6f.jpg",
                fit: BoxFit.cover,
                height: 80,
                width: 80,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 3),
              padding:
                  const EdgeInsets.only(top: 1, bottom: 1, left: 3, right: 3),
              decoration: BoxDecoration(
                color: kObjectBackgroundColor,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Text(
                "An nhu buoi",
                style: GoogleFonts.openSans(
                  color: kTextInvertColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 8.sp,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 3),
              height: 70,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Wrap(
                  direction: Axis.horizontal,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 3, left: 1, right: 1),
                      padding: const EdgeInsets.only(
                          top: 1, bottom: 1, left: 3, right: 3),
                      decoration: BoxDecoration(
                        color: kObjectBackgroundColor,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Text(
                        "Dit me may",
                        style: GoogleFonts.openSans(
                          color: kTextInvertColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 5.sp,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 3, left: 1, right: 1),
                      padding: const EdgeInsets.only(
                          top: 1, bottom: 1, left: 3, right: 3),
                      decoration: BoxDecoration(
                        color: kObjectBackgroundColor,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Text(
                        "Cak",
                        style: GoogleFonts.openSans(
                          color: kTextInvertColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 5.sp,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 3, left: 1, right: 1),
                      padding: const EdgeInsets.only(
                          top: 1, bottom: 1, left: 3, right: 3),
                      decoration: BoxDecoration(
                        color: kObjectBackgroundColor,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Text(
                        "Cho",
                        style: GoogleFonts.openSans(
                          color: kTextInvertColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 5.sp,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 3, left: 1, right: 1),
                      padding: const EdgeInsets.only(
                          top: 1, bottom: 1, left: 3, right: 3),
                      decoration: BoxDecoration(
                        color: kObjectBackgroundColor,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Text(
                        "Buoi cu",
                        style: GoogleFonts.openSans(
                          color: kTextInvertColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 5.sp,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 3, left: 1, right: 1),
                      padding: const EdgeInsets.only(
                          top: 1, bottom: 1, left: 3, right: 3),
                      decoration: BoxDecoration(
                        color: kObjectBackgroundColor,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Text(
                        "Hehhe",
                        style: GoogleFonts.openSans(
                          color: kTextInvertColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 5.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
