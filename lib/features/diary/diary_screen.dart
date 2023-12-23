import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_tracking/features/diary/components/calender.dart';
import 'package:health_tracking/features/diary/diary_controller.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../utility/theme.dart';
import '../dashboard/components/food_card.dart';
import 'components/diary_box.dart';
import 'components/meal_box.dart';

class DiaryScreen extends GetView<DiaryController> {
  const DiaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 30, bottom: 5, left: 5, right: 5
        ),
        child: Column(
          children: [
            Calender(),
            MealBox(),
            DiaryBox(),
          ],
        ),
      ),
    );
  }
}