import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../local/database/nutritions_database.dart';
import '../../../routes/app_pages.dart';
import '../../local/database/daily_plan.dart';
import '../../local/database/plan.dart';

class DetailPlanController extends GetxController {
  final planId = Get.arguments['planId'];

  late Rx<DateTime> date;
  late Rx<DateTime> time;
  final DateFormat timeFormatter = DateFormat('jm');
  final DateFormat dateFormatter = DateFormat('yMEd');
  final DateFormat dateFormat = DateFormat('yMd');

  late final TextEditingController nameController;
  late final TextEditingController caloriesController;
  late final TextEditingController proteinController;
  late final TextEditingController carbohydratesController;
  late final TextEditingController fatController;

  final PlanDao planDao = Get.find();
  final DailyPlanDao dailyPlanDao = Get.find();
  final NutritionsDao nutritionsDao = Get.find();

  late final PlanData planData;
  late final DailyPlanData dailyPlanData;
  var nutritionList = RxList<NutritionData>([]);

  var isLoading = true.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    isLoading.value = await initLineData(planId);
  }

  initLineData(int id) async {
    planData = await planDao.watchPlanById(id);
    nameController = TextEditingController(text: planData.name);
    caloriesController = TextEditingController(text: planData.calories.toString());
    proteinController = TextEditingController(text: planData.protein.toString());
    carbohydratesController = TextEditingController(text: planData.carbohydrates.toString());
    fatController = TextEditingController(text: planData.fat.toString());
    date = planData.date.obs;
    time = planData.time.obs;
    await loadNutrition(planData.name);
    return false;
  }

  onChangeName(value) {
    nameController.text = value;
    loadNutrition(value);
  }

  loadNutrition(String key) async {
    nutritionList.value = await nutritionsDao.searchNutrition(key);
  }

  onChooseFood(int index) {
    NutritionData target = nutritionList[index];
    nameController.text = target.name;
    caloriesController.text = target.calories.toString();
    proteinController.text = target.protein.toString();
    carbohydratesController.text = target.carbohydrates.toString();
    fatController.text = target.fat.toString();
  }

  Future<void> deletePlan() async {
    dailyPlanData = await dailyPlanDao.getDailyPlanByDate(planData.date);
    await dailyPlanDao.updateDailyPlan(DailyPlanData(
        id: dailyPlanData.id,
        date: dailyPlanData.date,
        calories: dailyPlanData.calories - planData.calories,
        protein: dailyPlanData.protein - planData.protein,
        carbohydrates: dailyPlanData.carbohydrates - planData.carbohydrates,
        fat: dailyPlanData.fat - planData.fat));
    await planDao.deletePlan(planData);
    await Get.offNamed(AppRoutes.rMain);
    Get.until((route) => route.isFirst);
  }
}
