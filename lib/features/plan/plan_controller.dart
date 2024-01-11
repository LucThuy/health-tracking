import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_tracking/local/database/plan.dart';

import '../../local/database/daily_plan.dart';
import '../../local/database/nutritions_database.dart';
import '../../routes/app_pages.dart';

class PlanController extends GetxController {
  Rx<TimeOfDay> selectedTime = TimeOfDay.now().obs;
  final PlanDao planDao = Get.find();
  final DailyPlanDao dailyPlanDao = Get.find();

  late final TextEditingController nameController;
  late final TextEditingController caloriesController;
  late final TextEditingController proteinController;
  late final TextEditingController carbohydratesController;
  late final TextEditingController fatController;

  final NutritionsDao nutritionsDao = Get.find();

  var nutritionList = RxList<NutritionData>([]);


  @override
  Future<void> onInit() async {
    super.onInit();
    nameController = TextEditingController(text: "");
    caloriesController = TextEditingController(text: "");
    proteinController = TextEditingController(text: "");
    carbohydratesController = TextEditingController(text: "");
    fatController = TextEditingController(text: "");
    await loadNutrition("");
  }

  loadNutrition(String key) async {
    nutritionList.value = await nutritionsDao.searchNutrition(key);
  }

  onChangeName(value) {
    nameController.text = value;
    loadNutrition(value);
  }

  onChooseFood(int index) {
    NutritionData target = nutritionList[index];
    nameController.text = target.name;
    caloriesController.text = target.calories.toString();
    proteinController.text = target.protein.toString();
    carbohydratesController.text = target.carbohydrates.toString();
    fatController.text = target.fat.toString();
  }

  void updateTime(TimeOfDay newTime) {
    selectedTime.value = newTime;
  }

  Future<void> savePlan(DateTime focusedDay) async {
    DateTime now = DateTime.now();
    // Combine the date and time
    DateTime combinedDateTime = DateTime(focusedDay.year, focusedDay.month, focusedDay.day, selectedTime.value.hour, selectedTime.value.minute,);
    await planDao.insertPlan(PlanCompanion.insert(
      name: nameController.text,
      time: combinedDateTime,
      calories: double.parse(caloriesController.text),
      protein: double.parse(proteinController.text),
      carbohydrates: double.parse(carbohydratesController.text),
      fat: double.parse(fatController.text),
      date: focusedDay,
    ));
    DailyPlanData dailyPlan = await dailyPlanDao.getDailyPlanByDate(focusedDay);
    await dailyPlanDao.updateDailyPlan(DailyPlanData(
        id: dailyPlan.id,
        date: focusedDay,
        calories: dailyPlan.calories + double.parse(caloriesController.text),
        protein: dailyPlan.protein + double.parse(proteinController.text),
        carbohydrates: dailyPlan.carbohydrates + double.parse(carbohydratesController.text),
        fat: dailyPlan.fat + double.parse(fatController.text)));
    await Get.toNamed(AppRoutes.rMain);
    Get.until((route) => route.isFirst);
  }




}