import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_tracking/features/nutrition/components/results_tab.dart';

import '../../../local/model/food_type.dart';
import '../nutrition_controller.dart';

class IngredientResultsTab extends StatelessWidget {
  final NutritionController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    controller.showAll(FoodType.ingredient);
    return ResultsTab(foodType: FoodType.ingredient);
  }
}