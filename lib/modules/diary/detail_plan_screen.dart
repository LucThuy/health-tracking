import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_tracking/routes/app_pages.dart';
import 'package:health_tracking/share/food_card_select.dart';
import 'package:sizer/sizer.dart';

import '../../../utility/theme.dart';
import '../main/main_controller.dart';
import 'detail_plan_controller.dart';

class DetailPlanScreen extends GetView<DetailPlanController> {
  DetailPlanScreen({super.key});

  final mainController = Get.find<MainController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(gradient: kGradientGreen50White),
        child: SafeArea(
          child: Obx(
            () => controller.isLoading.value
                ? Center(
                    child: Text(
                      "Loading...",
                      style: GoogleFonts.pangolin(
                        color: kGreen800,
                        fontWeight: FontWeight.w700,
                        fontSize: 20.sp,
                      ),
                    ),
                  )
                : SingleChildScrollView(
                    reverse: true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 5.h,
                          child: Center(
                            child: Text("PLAN DETAIL",
                                style: GoogleFonts.pangolin(
                                  color: kGreen800,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20.sp,
                                )),
                          ),
                        ),
                        SizedBox(
                          // height: 43.h,
                          child: Column(
                            children: [
                              // Card(
                              //   elevation: 3,
                              //   shadowColor: kGreen950,
                              //   margin:
                              //       const EdgeInsets.only(top: 10, bottom: 10),
                              //   child: ClipRRect(
                              //     borderRadius: BorderRadius.circular(10),
                              //     // child: Image.file(
                              //     //   File(controller.lineData.imagePath),
                              //     //   fit: BoxFit.cover,
                              //     //   height: 300,
                              //     //   width: 300,
                              //     // ),
                              //   ),
                              // ),
                              Obx(
                                () => Container(
                                  padding: const EdgeInsets.only(
                                      left: 30, right: 30),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        controller.dateFormatter.format(
                                            controller.date.value),
                                        style: GoogleFonts.pangolin(
                                          color: kGreen800,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      Text(
                                        controller.timeFormatter.format(
                                            controller.time.value),
                                        style: GoogleFonts.pangolin(
                                          color: kGreen800,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 90.w,
                          // height: 50.h,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Column(
                                children: [
                                  TextField(
                                    readOnly: true,
                                    controller: controller.nameController,
                                    onChanged: (value) =>
                                        {controller.onChangeName(value)},
                                    cursorColor: kGreen800,
                                    style: GoogleFonts.pangolin(
                                      color: kGreen800,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12.sp,
                                    ),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.only(
                                            top: 20,
                                            bottom: 15,
                                            left: 20,
                                            right: 20),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        floatingLabelStyle:
                                            GoogleFonts.pangolin(
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
                                            borderSide: const BorderSide(
                                                color: kGreen800),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: kGreen800, width: 2),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: kGreen800),
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                  ),
                                  Obx(
                                    () => RefreshIndicator(
                                      onRefresh: () => controller.loadNutrition(
                                          controller.nameController.text),
                                      child: Center(
                                        child: SizedBox(
                                          height: 200,
                                          child: controller
                                                  .nutritionList.isEmpty
                                              ? Center(
                                                  child: Text(
                                                    "Nothing found",
                                                    style: GoogleFonts.pangolin(
                                                      color: kGreen800,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 14.sp,
                                                    ),
                                                  ),
                                                )
                                              : ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: controller
                                                      .nutritionList.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        controller.onChooseFood(
                                                            index);
                                                      },
                                                      child: FoodCardChoice(
                                                          nutritionData:
                                                              controller
                                                                  .nutritionList
                                                                  .elementAt(
                                                                      index)),
                                                    );
                                                  }),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    readOnly: true,
                                    controller: controller.caloriesController,
                                    cursorColor: kGreen800,
                                    style: GoogleFonts.pangolin(
                                      color: kGreen800,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12.sp,
                                    ),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.only(
                                            top: 20,
                                            bottom: 15,
                                            left: 20,
                                            right: 20),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        floatingLabelStyle:
                                            GoogleFonts.pangolin(
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
                                        labelText: "Calories",
                                        hintText: "Ex. 100",
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: kGreen800),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: kGreen800, width: 2),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: kGreen800),
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    readOnly: true,
                                    controller: controller.proteinController,
                                    cursorColor: kGreen800,
                                    style: GoogleFonts.pangolin(
                                      color: kGreen800,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12.sp,
                                    ),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.only(
                                            top: 20,
                                            bottom: 15,
                                            left: 20,
                                            right: 20),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        floatingLabelStyle:
                                            GoogleFonts.pangolin(
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
                                        labelText: "Protein",
                                        hintText: "Ex. 100",
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: kGreen800),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: kGreen800, width: 2),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: kGreen800),
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    readOnly: true,
                                    controller:
                                        controller.carbohydratesController,
                                    cursorColor: kGreen800,
                                    style: GoogleFonts.pangolin(
                                      color: kGreen800,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12.sp,
                                    ),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.only(
                                            top: 20,
                                            bottom: 15,
                                            left: 20,
                                            right: 20),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        floatingLabelStyle:
                                            GoogleFonts.pangolin(
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
                                        labelText: "Carbohydrates",
                                        hintText: "Ex. 100",
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: kGreen800),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: kGreen800, width: 2),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: kGreen800),
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    readOnly: true,
                                    controller: controller.fatController,
                                    cursorColor: kGreen800,
                                    style: GoogleFonts.pangolin(
                                      color: kGreen800,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12.sp,
                                    ),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.only(
                                            top: 20,
                                            bottom: 15,
                                            left: 20,
                                            right: 20),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        floatingLabelStyle:
                                            GoogleFonts.pangolin(
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
                                        labelText: "Fat",
                                        hintText: "Ex. 100",
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: kGreen800),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: kGreen800, width: 2),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: kGreen800),
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                        ),
                      ],
                    ),
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
              key: UniqueKey(),
              confirmDismiss:
                  (DismissDirection dismissDirection) async {
                switch (dismissDirection) {
                  case DismissDirection.endToStart:
                    return await _showConfirmationDialog(
                        context, 'cancel') ==
                        true;
                  case DismissDirection.startToEnd:
                    return await _showConfirmationDialog(
                        context, 'delete') ==
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
                  {controller.deletePlan()}
                else if (direction ==
                    DismissDirection.endToStart)
                  {
                    Get.offAllNamed(AppRoutes.rMain),
                    Future.delayed(Duration.zero, () {
                      Get.find<MainController>().currentIndex.value = 1;
                      Get.until((route) => route.isFirst);
                    }),
                  }
              },
              background: Container(
                color: kGreen600,
                child: Center(
                  child: Text(
                    "Delete",
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
                  padding: const EdgeInsets.only(
                      left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                              Icons
                                  .arrow_back_ios_new_rounded,
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
                            "Delete",
                            style: GoogleFonts.pangolin(
                              color: kWhite,
                              fontWeight: FontWeight.w700,
                              fontSize: 12.sp,
                            ),
                          ),
                          const Icon(
                              Icons.arrow_forward_ios_rounded,
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
