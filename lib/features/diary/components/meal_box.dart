import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_tracking/features/plan/plan_controller.dart';
import 'package:sizer/sizer.dart';

import '../../../utility/theme.dart';
import '../../dashboard/components/food_card.dart';
import '../../plan/plan_screen.dart';
import 'meal_card.dart';

class MealBox extends StatelessWidget {
  var focusedDay;
  final planController = Get.find<PlanController>();

  MealBox(DateTime focusedDay, {Key? key}) : super(key: key){
    this.focusedDay = focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
        future: planController.getPlan(focusedDay),
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
              child: buildPlanBoxUI(context),
            );
          }
        });
  }

  Widget buildPlanBoxUI(BuildContext context){
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Card(
                          color: kGreen50o6,
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
                        ),
                        Expanded(
                          child: Center(
                            child: SizedBox(
                              height: 220,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: planController.planList.length + 1,
                                  itemBuilder: (context, index) {
                                    if (index != planController.planList.length) {
                                      return MealCard(
                                          plan: planController.planList.elementAt(index));
                                    }
                                    return null;
                                  }),
                            ),
                          ),
                        ),
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