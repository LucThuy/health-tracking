import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_tracking/features/diary/diary_controller.dart';
import 'package:sizer/sizer.dart';

import '../../../utility/theme.dart';
import '../plan_controller.dart';

class TimePicker extends StatelessWidget {
  final timeController = Get.find<PlanController>();
  final diaryController = Get.find<DiaryController>();

  TimePicker({Key? key}) : super(key: key){

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kGreen800o9,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            top: 5, bottom: 5, left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Text(
            //   "Thời gian:",
            //   style: GoogleFonts.pangolin(
            //       color: kWhite,
            //       fontWeight: FontWeight.w700,
            //       fontSize: 14.sp
            //   ),
            // ),
            Row(
              children: [
                IconButton(onPressed: () async {
                  TimeOfDay? newTime = await showTimePicker(
                    context: context,
                    initialTime: timeController.selectedTime.value,
                  );
                  if (newTime != null) {
                    timeController.updateTime(newTime);
                  }
                }, icon: Icon(Icons.settings, color: Colors.white,)),
                Obx(
                      () => Text(
                    '${timeController.selectedTime.value.hour.toString().padLeft(2, '0')}:${timeController.selectedTime.value.minute.toString().padLeft(2, '0')}',
                        style: GoogleFonts.pangolin(
                            color: kWhite,
                            fontWeight: FontWeight.w700,
                            fontSize: 14.sp
                        ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text(
                  diaryController.formatter.format(diaryController.focusedDay.value),
                style: GoogleFonts.pangolin(
                    color: kWhite,
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}