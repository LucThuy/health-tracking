import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_tracking/features/nutrition/components/results_tab.dart';
import 'package:health_tracking/local/database/nutritions_database.dart';

import '../../../local/model/food_type.dart';
import '../nutrition_controller.dart';

class FoodResultsTab extends StatefulWidget {
  @override
  _FoodWidget createState() => _FoodWidget();
}

class _FoodWidget extends State<FoodResultsTab> {
  final NutritionController controller = Get.find();
  final NutritionsDao nutritionsDao = Get.find();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.showAll(FoodType.food),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ResultsTab( foodType: 'food');
        } else {
          return CircularProgressIndicator(); // or some loading indicator
        }
      },
    );
  }
}
