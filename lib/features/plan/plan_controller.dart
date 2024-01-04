import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlanController extends GetxController {
  Rx<TimeOfDay> selectedTime = TimeOfDay.now().obs;

  void updateTime(TimeOfDay newTime) {
    selectedTime.value = newTime;
  }
}