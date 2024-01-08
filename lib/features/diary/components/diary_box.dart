import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_tracking/features/dashboard/dashboard_controller.dart';
import 'package:health_tracking/features/diary/diary_controller.dart';
import 'package:sizer/sizer.dart';

import '../../../local/database/diary.dart';
import '../../../utility/theme.dart';
import '../../dashboard/components/food_card.dart';
import '../page/diary_page.dart';

class DiaryBox extends StatelessWidget {
  var focusedDay;
  var diaryDao;
  var diaryController = Get.find<DiaryController>();


  DiaryBox(DateTime focusedDay, DiaryDao diaryDao, {Key? key}) : super(key: key){
    this.focusedDay = focusedDay;
    this.diaryDao = diaryDao;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
    future: diaryController.getLine(focusedDay),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        // Show a loading indicator while waiting for the Future to complete
        return CircularProgressIndicator();
      } else if (snapshot.hasError) {
        // Show an error message if the Future fails
        return Text('Error: ${snapshot.error}');
      } else {
        // Show the data when the Future is complete
        return Center(
          child: buildDiaryBoxUI(),
        );
      }
    });
  }

  Widget buildDiaryBoxUI() {
    return SizedBox(
      height: 38.h,
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
              color: kGreen800o9,
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  top: 0.5.h, bottom: 0.5.h, left: 3.w, right: 3.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nhật ký",
                    style: GoogleFonts.pangolin(
                        color: kWhite,
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: SizedBox(
                        height: 220,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: diaryController.lineList.length + 1,
                            itemBuilder: (context, index) {
                              if (index !=
                                  diaryController.lineList.length) {
                                return FoodCard(
                                    line: diaryController
                                        .lineList
                                        .elementAt(
                                        index));
                              }
                              return null;
                            }),
                      ),
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