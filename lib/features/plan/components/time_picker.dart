import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../utility/theme.dart';
import '../plan_controller.dart';

class TimePicker extends StatelessWidget {
  final timeController = Get.find<PlanController>();

  TimePicker({Key? key}) : super(key: key){

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kGreen800o9,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 5, bottom: 5, left: 10, right: 10),
          child: Row(
            children: [
              Text(
                "Thời gian:",
                style: GoogleFonts.pangolin(
                    color: kWhite,
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp
                ),
              ),
              GestureDetector(
                onTap: () async {
                  TimeOfDay? newTime = await showTimePicker(
                    context: context,
                    initialTime: timeController.selectedTime.value,
                  );
                  if (newTime != null) {
                    timeController.updateTime(newTime);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                     gradient: kBackgroundLinearMainSubColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Obx(
                          () => Text(
                        '${timeController.selectedTime.value.hour.toString().padLeft(2, '0')}:${timeController.selectedTime.value.minute.toString().padLeft(2, '0')}',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}