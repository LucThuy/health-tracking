import 'dart:io';

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

  final LineDao lineDao = Get.find();
  final PageDao pageDao = Get.find();
  final NutritionsDao nutritionsDao = Get.find();

  var nutritionList = RxList<NutritionData>([]);
  var name = "".obs;
  var calories = 0.0.obs;
  var protein = 0.0.obs;
  var carbohydrates = 0.0.obs;
  var fat = 0.0.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await loadNutrition("");
  }

  onChangeName(value) {
    name.value = value;
    loadNutrition(value);
  }

  loadNutrition(String key) async {
    nutritionList.value = await nutritionsDao.searchNutrition(key);
    print(nutritionList.value);
  }

  onChooseFood(int index) {
    NutritionData target = nutritionList[index];
    name.value = target.name;
    calories.value != target.calories;
    protein.value != target.protein;
    carbohydrates.value != target.carbohydrates;
    fat.value != target.fat;
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
      name: name.value,
      calories: calories.value,
      protein: protein.value,
      carbohydrates: carbohydrates.value,
      fat: fat.value,
    ));
    Get.toNamed(AppRoutes.rMain);
  }
}
