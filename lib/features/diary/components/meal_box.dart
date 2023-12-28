import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../utility/theme.dart';
import '../../plan/plan_screen.dart';

class MealBox extends StatelessWidget {
  var focusedDay;

  MealBox(DateTime focusedDay, {Key? key}) : super(key: key){
    this.focusedDay = focusedDay;
  }

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
                    "Kế hoạch ăn uống",
                    style: GoogleFonts.pangolin(
                        color: kGreen800,
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Card(
                          color: kBackgroundTransparentSubZeroColor,
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: SizedBox(
                            height: 200,
                            width: 100,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => PlanPage(focusedDay)),
                                );
                              },
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