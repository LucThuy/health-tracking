import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_tracking/features/plan/components/time_picker.dart';
import 'package:health_tracking/features/plan/plan_controller.dart';
import 'package:sizer/sizer.dart';

import '../../routes/app_pages.dart';
import '../../share/food_card_select.dart';
import '../../utility/theme.dart';
import '../diary/components/nutrition_button.dart';
import '../diary/diary_controller.dart';

class PlanPage extends GetView<PlanController> {
  final diaryController = Get.find<DiaryController>();
  final textController = TextEditingController();
  var focusedDay;


  PlanPage(DateTime focusedDay){
    this.focusedDay = focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.only(left: 12),
          child: Text(
              'Add Plan',
              style: GoogleFonts.pangolin(
                color: kGreen800,
                fontWeight: FontWeight.w700,
                fontSize: 20.sp,
              )
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(gradient: kGradientGreen100White),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TimePicker(),
                NutritionButton(),
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: TextField(
                    onChanged: (value) => {diaryController.onChangeName(value)},
                    cursorColor: kGreen800,
                    style: GoogleFonts.pangolin(
                      color: kGreen800,
                      fontWeight: FontWeight.w300,
                      fontSize: 12.sp,
                    ),
                    controller: textController,
                    decoration: InputDecoration(

                        contentPadding: const EdgeInsets.only(
                            top: 20, bottom: 15, left: 20, right: 20),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        floatingLabelStyle: GoogleFonts.pangolin(
                          color: kGreen800,
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                        ),
                        labelStyle: GoogleFonts.pangolin(
                          color: kGreen800,
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                        ),
                        fillColor: kWhite,
                        filled: true,
                        labelText: "Dish name",
                        hintText: "Ex. Bún đậu mắm tôm",
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: kGreen800),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: kGreen800, width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: kGreen800),
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Obx(
                      () => RefreshIndicator(
                    onRefresh: () =>
                        diaryController.loadNutrition(diaryController.name.value),
                    child: Center(
                      child: SizedBox(
                        height: 200,
                        child: diaryController.nutritionList.isEmpty
                            ? Center(
                          child: Text(
                            "Nothing found",
                            style: GoogleFonts.pangolin(
                              color: kGreen800,
                              fontWeight: FontWeight.w700,
                              fontSize: 14.sp,
                            ),
                          ),
                        )
                            : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                            diaryController.nutritionList.length,
                            itemBuilder: (context, index) {
                              return FoodCardChoice(
                                  nutritionData: diaryController
                                      .nutritionList
                                      .elementAt(index));
                            }),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 60, right: 60),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 5,
          shadowColor: kGreen950,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Dismissible(
              key: const Key("ActionButton"),
              confirmDismiss:
                  (DismissDirection dismissDirection) async {
                switch (dismissDirection) {
                  case DismissDirection.endToStart:
                    return await _showConfirmationDialog(
                        context, 'cancel') ==
                        true;
                  case DismissDirection.startToEnd:
                    return await _showConfirmationDialog(
                        context, 'save') ==
                        true;
                  case DismissDirection.horizontal:
                  case DismissDirection.vertical:
                  case DismissDirection.up:
                  case DismissDirection.down:
                  case DismissDirection.none:
                    assert(false);
                }
                return false;
              },
              onDismissed: (direction) => {
                if (direction == DismissDirection.startToEnd)
                  {
                    controller.savePlan(controller.selectedTime.value, diaryController.focusedDay.value, textController.text)
                  }
                else if (direction == DismissDirection.endToStart)
                  {Get.toNamed(AppRoutes.rMain)}
              },
              background: Container(
                color: kGreen600,
                child: Center(
                  child: Text(
                    "Save",
                    style: GoogleFonts.pangolin(
                      color: kWhite,
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
              secondaryBackground: Container(
                color: kRed600,
                child: Center(
                  child: Text(
                    "Back",
                    style: GoogleFonts.pangolin(
                      color: kWhite,
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
              child: Container(
                  height: 70,
                  color: kGreen800,
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.arrow_back_ios_new_rounded,
                              color: kWhite),
                          Text(
                            "Back",
                            style: GoogleFonts.pangolin(
                              color: kWhite,
                              fontWeight: FontWeight.w700,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Save",
                            style: GoogleFonts.pangolin(
                              color: kWhite,
                              fontWeight: FontWeight.w700,
                              fontSize: 12.sp,
                            ),
                          ),
                          const Icon(Icons.arrow_forward_ios_rounded,
                              color: kWhite),
                        ],
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool?> _showConfirmationDialog(BuildContext context, String action) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Do you want to $action current process?',
            style: GoogleFonts.pangolin(
              color: kGreen800,
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
            ),
          ),
          elevation: 10,
          shadowColor: kGreen950,
          backgroundColor: kWhite,
          actions: [
            ElevatedButton(
              style: ButtonStyle(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  backgroundColor: MaterialStateProperty.all(kGreen600)),
              child: Text(
                'Yes',
                style: GoogleFonts.pangolin(
                  color: kWhite,
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                ),
              ),
              onPressed: () {
                Navigator.pop(context, true); // showDialog() returns true
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  backgroundColor: MaterialStateProperty.all(kRed600)),
              child: Text(
                'No',
                style: GoogleFonts.pangolin(
                  color: kWhite,
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                ),
              ),
              onPressed: () {
                Navigator.pop(context, false); // showDialog() returns false
              },
            ),
          ],
        );
      },
    );
  }

}