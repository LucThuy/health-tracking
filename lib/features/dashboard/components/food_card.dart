import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../utility/theme.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kBackgroundTransparentSubZeroColor,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        padding: const EdgeInsets.only(top: 3, bottom: 3, left: 6, right: 6),
        height: 210,
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: kBackgroundMainColor,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  margin: const EdgeInsets.only(bottom: 3),
                  padding: const EdgeInsets.only(
                      top: 1, bottom: 1, left: 5, right: 5),
                  child: Text(
                    "10:30",
                    style: GoogleFonts.openSans(
                      color: kTextInvertColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 8.sp,
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
                height: 100,
                width: 100,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              padding:
              const EdgeInsets.only(top: 1, bottom: 1, left: 10, right: 10),
              decoration: BoxDecoration(
                color: kBackgroundMainColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  "Nem nướng Nha Trang",
                  style: GoogleFonts.openSans(
                    color: kTextInvertColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 10.sp,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 3),
              padding: const EdgeInsets.only(left: 5, right: 5),
              height: 55,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Wrap(
                  direction: Axis.horizontal,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 3, left: 1, right: 1),
                      padding: const EdgeInsets.only(
                          top: 1, bottom: 1, left: 5, right: 5),
                      decoration: BoxDecoration(
                        color: kBackgroundMainColor,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Text(
                        "Khá ngon bro",
                        style: GoogleFonts.openSans(
                          color: kTextInvertColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 7.sp,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 3, left: 1, right: 1),
                      padding: const EdgeInsets.only(
                          top: 1, bottom: 1, left: 5, right: 5),
                      decoration: BoxDecoration(
                        color: kBackgroundMainColor,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Text(
                        "Đói",
                        style: GoogleFonts.openSans(
                          color: kTextInvertColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 7.sp,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 3, left: 1, right: 1),
                      padding: const EdgeInsets.only(
                          top: 1, bottom: 1, left: 5, right: 5),
                      decoration: BoxDecoration(
                        color: kBackgroundMainColor,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Text(
                        "Tè vạ",
                        style: GoogleFonts.openSans(
                          color: kTextInvertColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 7.sp,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 3, left: 1, right: 1),
                      padding: const EdgeInsets.only(
                          top: 1, bottom: 1, left: 5, right: 5),
                      decoration: BoxDecoration(
                        color: kBackgroundMainColor,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Text(
                        "Đéo hiểu",
                        style: GoogleFonts.openSans(
                          color: kTextInvertColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 7.sp,
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
