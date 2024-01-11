import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../local/database/nutrition_database.dart';
import '../../local/database/nutritions_database.dart' as ndb;
import '../../local/model/food_type.dart';
import '../../local/model/nutrition_data.dart';

class NutritionController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxList<NutritionData> foodResults = <NutritionData>[].obs;
  RxList<NutritionData> mealResults = <NutritionData>[].obs;
  RxList<NutritionData> ingredientResults = <NutritionData>[].obs;
  final ndb.NutritionsDao nutritionsDao = Get.find();
  late NutritionDatabase nutritionDatabase;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    // nutritionDatabase = NutritionDatabase(nutritionsDao);
    // nutritionDatabase.createData();
  }

  Future<void> performSearch() async{
    foodResults.assignAll(
       await nutritionDatabase.search(FoodType.food, searchController.text));
    mealResults.assignAll(
        await nutritionDatabase.search(FoodType.meal, searchController.text));
    ingredientResults.assignAll(
        await nutritionDatabase.search(FoodType.ingredient, searchController.text));
  }

  Future<void> showAll(FoodType foodType) async {
    switch (foodType) {
      case FoodType.food:
        foodResults.assignAll(await nutritionDatabase.get(FoodType.food));
        break;
      case FoodType.meal:
        mealResults.assignAll(await nutritionDatabase.get(FoodType.meal));
        break;
      case FoodType.ingredient:
        ingredientResults
            .assignAll(await nutritionDatabase.get(FoodType.ingredient));
        break;
    }
  }
}
