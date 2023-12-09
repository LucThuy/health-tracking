import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../utility/theme.dart';

class Calender extends StatelessWidget {
  const Calender({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 50.h,
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
              gradient: kBackgroundLinearMainSubColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 0, bottom: 0, left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TableCalendar(
                    focusedDay: DateTime.now(),
                    firstDay: DateTime.utc(2023, 10, 16),
                    lastDay: DateTime.utc(2024, 3, 14),
                    rowHeight: 40,
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                    ),
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