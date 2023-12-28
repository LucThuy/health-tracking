import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_picker_spinner/time_picker_spinner.dart';

import '../plan_controller.dart';

class TimePicker extends StatelessWidget {
  final timeController = Get.find<PlanController>();

  TimePicker({Key? key}) : super(key: key){

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        Text("data"),
        TimePickerSpinner(
          itemHeight: 30,
          normalTextStyle: TextStyle(
            color: Colors.transparent
          ),
          spacing: 0,
          highlightedTextStyle: const TextStyle(fontSize: 24, color: Colors.blue),
          isForce2Digits: true,
          onTimeChange: (time) {
            timeController.updateTime(time);
          },
        ),
      ],
    );
  }
}