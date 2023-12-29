import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        Text("Thời gian:"),
        GestureDetector(
          onTap: () async {
            TimeOfDay? newTime = await showTimePicker(
                context: context,
                initialTime: timeController.selectedTime.value
            );
            if (newTime != null){
              timeController.updateTime(newTime);
            }
          },
          child: Obx(
                () => Text(
              '${timeController.selectedTime.value.hour.toString().padLeft(2, '0')}:${timeController.selectedTime.value.minute.toString().padLeft(2, '0')}',
              style: TextStyle(fontSize: 24),
            ),
          ),
        )
      ],
    );
  }
}