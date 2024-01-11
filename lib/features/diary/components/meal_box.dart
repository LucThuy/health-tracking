import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../utility/theme.dart';
import '../../plan/plan_screen.dart';
import '../diary_controller.dart';
import 'meal_card.dart';

class MealBox extends StatelessWidget {
  var focusedDay;
  final diaryController = Get.find<DiaryController>();

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
              color: kGreen800o9,
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  top: 0.5.h, bottom: 0.5.h, left: 3.w, right: 3.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Planning Meal",
                    style: GoogleFonts.pangolin(
                        color: kWhite,
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder<void>(
                      future: diaryController.getPlan(focusedDay),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return SizedBox(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: diaryController.planList.length + 1,
                              itemBuilder: (context, index) {
                                if (index == diaryController.planList.length) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      color: kGreen50o6,
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                        child: SizedBox(
                                          width: 150,
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        PlanPage(focusedDay)),
                                              );
                                            },
                                            child: Center(
                                              child: Icon(
                                                Icons.add,
                                                size: 80,
                                                color: kTextInvertColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: MealCard(
                                      plan: diaryController.planList.elementAt(
                                          index),
                                    ),
                                  );
                                }
                              },
                            ),
                          );
                        }
                      }
                    ),
                  )
                ],
              ),
            ),
          ),
        ),

      ),
    );
  }
}