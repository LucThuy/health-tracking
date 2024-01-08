import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_tracking/local/database/nutritions_database.dart';
import 'package:health_tracking/local/model/food_type.dart';
import 'package:health_tracking/routes/app_pages.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

import '../../../local/line/line.dart';
import '../../../local/page/page.dart';

class AddLineController extends GetxController {
  var currentDate = DateTime.now().obs;
  final DateFormat timeFormatter = DateFormat('jm');
  final DateFormat dateFormatter = DateFormat('yMEd');
  final DateFormat dateFormat = DateFormat('yMd');
  final image = Get.arguments['image'];
  final nameController = TextEditingController(text: "");
  final caloriesController = TextEditingController(text: "");
  final proteinController = TextEditingController(text: "");
  final carbohydratesController = TextEditingController(text: "");
  final fatController = TextEditingController(text: "");

  final LineDao lineDao = Get.find();
  final PageDao pageDao = Get.find();
  final NutritionsDao nutritionsDao = Get.find();

  var nutritionList = RxList<NutritionData>([]);

  @override
  Future<void> onInit() async {
    super.onInit();
    await loadNutrition("");
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

  Future<void> insertLine() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    File savedImage = await File(image).copy("$path/$currentDate.jpg");
    PageData todayPage =
        await pageDao.getPageByDate(dateFormat.format(currentDate.value));
    await lineDao.insertLine(LineCompanion.insert(
      pageId: todayPage.id,
      date: currentDate.value,
      imagePath: savedImage.path,
      name: nameController.text,
      calories: double.parse(caloriesController.text),
      protein: double.parse(proteinController.text),
      carbohydrates: double.parse(carbohydratesController.text),
      fat: double.parse(fatController.text),
    ));
    Get.toNamed(AppRoutes.rMain);
  }
}
