import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_tracking/local/database/plan.dart';

import '../../routes/app_pages.dart';

class PlanController extends GetxController {
  Rx<TimeOfDay> selectedTime = TimeOfDay.now().obs;
  final PlanDao planDao = Get.find();



  void updateTime(TimeOfDay newTime) {
    selectedTime.value = newTime;
  }

  void savePlan(TimeOfDay selectedTime, DateTime focusedDay, String content) {
    DateTime now = DateTime.now();
    // Combine the date and time
    DateTime combinedDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      selectedTime.hour,
      selectedTime.minute,
    );
    planDao.insertPlan(content, focusedDay, combinedDateTime);
    Get.toNamed(AppRoutes.rMain);
  }


}