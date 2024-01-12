import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../local/database/nutritions_database.dart';
import '../../../local/line/line.dart';
import '../../../local/page/page.dart';
import '../../../routes/app_pages.dart';

class DetailLineController extends GetxController {
  final lineId = Get.arguments['lineId'];

  var currentDate = DateTime.now().obs;
  final DateFormat timeFormatter = DateFormat('jm');
  final DateFormat dateFormatter = DateFormat('yMEd');
  final DateFormat dateFormat = DateFormat('yMd');

  late final TextEditingController nameController;
  late final TextEditingController caloriesController;
  late final TextEditingController proteinController;
  late final TextEditingController carbohydratesController;
  late final TextEditingController fatController;

  final LineDao lineDao = Get.find();
  final PageDao pageDao = Get.find();
  final NutritionsDao nutritionsDao = Get.find();

  late final LineData lineData;
  var nutritionList = RxList<NutritionData>([]);

  var isLoading = true.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    isLoading.value = await initLineData(lineId);
  }

  initLineData(int id) async {
    lineData = await lineDao.watchLineById(id);
    nameController = TextEditingController(text: lineData.name);
    caloriesController = TextEditingController(text: lineData.calories.toString());
    proteinController = TextEditingController(text: lineData.protein.toString());
    carbohydratesController = TextEditingController(text: lineData.carbohydrates.toString());
    fatController = TextEditingController(text: lineData.fat.toString());
    await loadNutrition(lineData.name);
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

  Future<void> deleteLine() async {
    PageData todayPage = await pageDao.getPageByDate(dateFormat.format(currentDate.value));
    await pageDao.updatePage(PageData(
        id: todayPage.id,
        date: todayPage.date,
        calories: todayPage.calories - lineData.calories,
        protein: todayPage.protein - lineData.protein,
        carbohydrates: todayPage.carbohydrates - lineData.carbohydrates,
        fat: todayPage.fat - lineData.fat));
    await lineDao.deleteLine(lineData);
    Get.offNamed(AppRoutes.rMain);
    Get.until((route) => route.isFirst);
  }
}
