import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_tracking/features/diary/components/calender.dart';
import 'package:health_tracking/features/diary/diary_controller.dart';

import '../../local/database/diary.dart';
import '../../utility/theme.dart';
import 'components/diary_box.dart';
import 'components/meal_box.dart';

class DiaryScreen extends GetView<DiaryController> {

  const DiaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: kGradientGreen50White),
        child: SingleChildScrollView(
            padding: const EdgeInsets.only(
                top: 30, bottom: 5, left: 5, right: 5
            ),
            child: Obx(() =>
                Column(
                  children: [
                    Calender(controller.focusedDay.value),
                    MealBox(controller.focusedDay.value),
                    DiaryBox(
                        controller.focusedDay.value,
                      Get.find<DiaryDao>()
                    ),
                  ],
                ),
            )
        ),
      ),
    );
  }
}
