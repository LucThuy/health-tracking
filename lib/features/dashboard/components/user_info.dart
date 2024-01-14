import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_tracking/features/dashboard/components/calendar.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../utility/theme.dart';

class DayCalories {
  final int index;
  final String day;
  final double calories;

  DayCalories({required this.index, required this.day, required this.calories});
}

class LineChartComponent extends StatelessWidget {
  final List<DayCalories> dayCaloriesList;
  final List<DayCalories> planningDayCaloriesList;
  final String userName;

  LineChartComponent(
      {required this.dayCaloriesList,
      required this.userName,
      required this.planningDayCaloriesList}) {
    for (var element in planningDayCaloriesList) {
      print(element.day);
      print(element.calories);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Convert the DayCalories list to FlSpot list
    return Column(
      children: [
        Calender(DateTime.now()),
        SizedBox(
            width: 100.w,
            height: 25.h,
            child: SfCartesianChart(
              enableSideBySideSeriesPlacement: false,
              primaryXAxis: CategoryAxis(
                title: AxisTitle(
                  text: 'Day',
                  textStyle: GoogleFonts.pangolin(
                    color: kWhite,
                    fontWeight: FontWeight.w700,
                    fontSize: 10.sp,
                  ),
                ),
              ),
              primaryYAxis: NumericAxis(
                title: AxisTitle(
                  text: 'Calories',
                  textStyle: GoogleFonts.pangolin(
                    color: kWhite,
                    fontWeight: FontWeight.w700,
                    fontSize: 10.sp,
                  ),
                ),
              ),
              series: [
                ColumnSeries<DayCalories, String>(
                  dataSource: dayCaloriesList,
                  xValueMapper: (DayCalories data, _) => data.day,
                  yValueMapper: (DayCalories data, _) => data.calories,
                ),
                ColumnSeries<DayCalories, String>(
                  opacity: 0.9,
                  width: 0.4,
                  dataSource: planningDayCaloriesList,
                  xValueMapper: (DayCalories data, _) => data.day,
                  yValueMapper: (DayCalories data, _) => data.calories,
                )
              ],
            )),
      ],
    );
  }
}
