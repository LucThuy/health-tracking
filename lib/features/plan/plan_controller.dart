import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlanController extends GetxController {
  Rx<TimeOfDay> selectedTime = TimeOfDay.now().obs;

  void updateTime(DateTime newTime) {
    selectedTime.value = TimeOfDay.fromDateTime(newTime);
  }
}