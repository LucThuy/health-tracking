import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../utility/theme.dart';
import '../page/diary_page.dart';

class DiaryBox extends StatelessWidget {
  var focusedDay;

  DiaryBox(DateTime focusedDay, {Key? key}) : super(key: key){
    this.focusedDay = focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 30.h,
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
                    "Nhật ký",
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
                        Card(
                          color: kBackgroundTransparentSubZeroColor,
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: SizedBox(
                            height: 60,
                            width: 300,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => DiaryPage(focusedDay)),
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