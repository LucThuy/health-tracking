import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../utility/theme.dart';
import '../diary_controller.dart';

class Calender extends StatelessWidget {
  final diaryController = Get.find<DiaryController>();
  var focusedDay;

  Calender(DateTime focusedDay, {Key? key}) : super(key: key){
    this.focusedDay = focusedDay;
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 20.h,
      width: 100.w,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kGreen800o9,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 0, bottom: 0, left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TableCalendar(
                    focusedDay: focusedDay,
                    firstDay: DateTime.utc(2023, 10, 16),
                    lastDay: DateTime.utc(2024, 3, 14),
                    rowHeight: 40,
                    calendarFormat: CalendarFormat.week,
                    selectedDayPredicate: (day) => isSameDay(day, focusedDay),
                    headerStyle: HeaderStyle(
                      titleTextStyle: GoogleFonts.pangolin(
                        color: kWhite,
                        fontWeight: FontWeight.w700,
                        fontSize: 20.sp
                      ),
                      formatButtonVisible: false,
                      titleCentered: true,
                    ),
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: GoogleFonts.pangolin(
                          color: kWhite,
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp
                      ),
                      weekendStyle: GoogleFonts.pangolin(
                          color: kWhite,
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp
                      ),
                    ),
                    calendarStyle: CalendarStyle(
                      defaultTextStyle: GoogleFonts.pangolin(
                          color: kWhite,
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp
                      ),
                      weekendTextStyle: GoogleFonts.pangolin(
                          color: kWhite,
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp
                      ),
                      todayTextStyle: GoogleFonts.pangolin(
                          color: kBlack,
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp
                      ),
                      selectedTextStyle: GoogleFonts.pangolin(
                          color: kWhite,
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp
                      ),
                      outsideTextStyle: GoogleFonts.pangolin(
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp
                      ),
                    ),
                    onDaySelected: (selectedDay, focusedDay) {
                      diaryController.updateSelectedDay(selectedDay);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}