import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_tracking/features/plan/components/time_picker.dart';
import 'package:health_tracking/features/plan/plan_controller.dart';
import 'package:sizer/sizer.dart';

import '../../utility/theme.dart';
import '../diary/diary_controller.dart';

class PlanPage extends GetView<PlanController> {
  final diaryController = Get.find<DiaryController>();
  var focusedDay;

  PlanPage(DateTime focusedDay){
    this.focusedDay = focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          diaryController.formatter.format(focusedDay),
          style: GoogleFonts.pangolin(
              color: kGreen800,
              fontWeight: FontWeight.w700,
              fontSize: 14.sp
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(gradient: kGradientGreen100White),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                TimePicker(),
            ],
          ),
        ),
      ),
    );
  }

}