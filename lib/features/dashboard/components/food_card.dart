import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_tracking/local/line/line.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../utility/theme.dart';

class FoodCard extends StatelessWidget {
  final LineData line;
  final DateFormat timeFormatter = DateFormat('jm');

  FoodCard({super.key, required this.line});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kGreen50o6,
      elevation: 3,
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
                child: Image.file(
                  File(line.imagePath),
                  fit: BoxFit.cover,
                  height: 140,
                  width: 140,
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 30,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      line.name,
                      style: GoogleFonts.pangolin(
                        color: kWhite,
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
                Text(
                  timeFormatter.format(line.date),
                  style: GoogleFonts.pangolin(
                    color: kWhite,
                    fontWeight: FontWeight.w700,
                    fontSize: 10.sp,
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
