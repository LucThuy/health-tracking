import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/food_results_tab.dart';
import 'components/ingredient_results_tab.dart';
import 'components/meal_results_tab.dart';
import 'nutrition_controller.dart';

class NutritionScreen extends GetView<NutritionController>{

  const NutritionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Số lượng tab
      child: Scaffold(
        appBar: AppBar(
          title: Text('Giá trị dinh dưỡng'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Thực phẩm'),
              Tab(text: 'Bữa ăn'),
              Tab(text: 'Nguyên liệu'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FoodResultsTab(),
            MealResultsTab(),
            IngredientResultsTab(),
          ],
        ),
      ),
    );
  }

}