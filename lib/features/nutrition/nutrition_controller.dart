import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../local/database/nutrition_database.dart';
import '../../local/model/food_type.dart';
import '../../local/model/nutrition_data.dart';

class NutritionController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxList<NutritionData> foodResults = <NutritionData>[].obs;
  RxList<NutritionData> mealResults = <NutritionData>[].obs;
  RxList<NutritionData> ingredientResults = <NutritionData>[].obs;

  void performSearch() {
    foodResults.assignAll(NutritionDatabase.search(FoodType.food, searchController.text));
    mealResults.assignAll(NutritionDatabase.search(FoodType.meal, searchController.text));
    ingredientResults.assignAll(NutritionDatabase.search(FoodType.ingredient, searchController.text));
  }

  void showAll(FoodType foodType){
    switch(foodType){
      case FoodType.food:
        foodResults.assignAll(NutritionDatabase.get(FoodType.food));
        break;
      case FoodType.meal:
        mealResults.assignAll(NutritionDatabase.get(FoodType.meal));
        break;
      case FoodType.ingredient:
        ingredientResults.assignAll(NutritionDatabase.get(FoodType.ingredient));
        break;
    }
  }
}