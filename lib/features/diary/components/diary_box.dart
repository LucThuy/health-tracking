import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_tracking/features/diary/diary_controller.dart';
import 'package:sizer/sizer.dart';

import '../../../utility/theme.dart';
import '../../dashboard/components/food_card.dart';

class DiaryBox extends StatelessWidget {
  var focusedDay;
  var diaryController = Get.find<DiaryController>();


  DiaryBox(DateTime focusedDay, {Key? key}) : super(key: key){
    this.focusedDay = focusedDay;
  }

  @override
  Widget build(BuildContext context) {
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
                    "Diary",
                    style: GoogleFonts.pangolin(
                        color: kWhite,
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: FutureBuilder<void>(
                        future: diaryController.getLine(focusedDay), // Hãy thay thế YourLineType bằng kiểu dữ liệu của lineList
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return SizedBox(
                              height: 220,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: diaryController.lineList.length + 1,
                                  itemBuilder: (context, index) {
                                    if (index !=
                                        diaryController.lineList.length) {
                                      return InkWell(
                                        onTap: () => {diaryController.detailLine(index)},
                                        child: FoodCard(
                                            line: diaryController
                                                .lineList
                                                .elementAt(
                                                index)),
                                      );
                                    }
                                    return null;
                                  }),
                            );
                          }
                        },
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