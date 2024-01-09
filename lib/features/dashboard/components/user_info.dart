import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DayCalories {
  final double index;
  final String day;
  final double calories;

  DayCalories({required this.index, required this.day, required this.calories});
}

class LineChartComponent extends StatelessWidget {
  final List<DayCalories> dayCaloriesList;
  final String userName;

  LineChartComponent({required this.dayCaloriesList, required this.userName});

  @override
  Widget build(BuildContext context) {
    // Convert the DayCalories list to FlSpot list
    List<FlSpot> dataPoints = dayCaloriesList
        .map((dayCalories) => FlSpot(dayCalories.index, dayCalories.calories))
        .toList();

    return Column(
      children: [
        SizedBox(
          width: 100.w,
          height: 25.h,
          child: LineChart(
            LineChartData(
              gridData: FlGridData(show: false),
              titlesData: FlTitlesData(
                leftTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40,
                  getTitles: (value) {
                    // Provide labels for the y-axis (left) based on calories
                    return value.toString();
                  },
                ),
                bottomTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 22,
                  getTitles: (value) {
                    // Provide labels for the x-axis (bottom) based on days
                    return value
                        .toInt()
                        .toString(); // Convert day to int for simplicity
                  },
                ),
              ),
              borderData: FlBorderData(show: true),
              minX: 0,
              maxX: dayCaloriesList.length.toDouble() - 1,
              minY: 0,
              maxY: dayCaloriesList
                  .map((dc) => dc.calories)
                  .reduce((a, b) => a > b ? a : b),
              lineBarsData: [
                LineChartBarData(
                  spots: dataPoints,
                  isCurved: true,
                  colors: [Colors.white],
                  dotData: FlDotData(show: false),
                  belowBarData: BarAreaData(show: false),
                ),
              ],
            ),
          ),
        ),
        Text(
          'Data chart of $userName',
          style: TextStyle(
            fontFamily: 'consolas',
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
