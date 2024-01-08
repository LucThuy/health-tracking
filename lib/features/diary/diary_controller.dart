import 'package:get/get.dart';
import 'package:health_tracking/local/database/diary.dart';
import 'package:intl/intl.dart';

import '../../local/database/nutritions_database.dart';
import '../../local/line/line.dart';
import '../../local/page/page.dart';
import '../../routes/app_pages.dart';

class DiaryController extends GetxController {
  Rx<DateTime> focusedDay = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).toUtc().add(Duration(hours: 7)).obs;
  final DateFormat formatter = DateFormat('yMEd');
  final DateFormat dateFormat = DateFormat('yMd');
  final DiaryDao diaryDao = Get.find();
  final PageDao pageDao = Get.find();
  final LineDao lineDao = Get.find();
  final lineList = RxList<LineData>([]);

  final NutritionsDao nutritionsDao = Get.find();

  var nutritionList = RxList<NutritionData>([]);

  var name = "".obs;




  void saveDiary(String content, DateTime date) async {
    await diaryDao.saveDiary(content, date);
    Get.toNamed(AppRoutes.rMain);
  }

  void updateSelectedDay(DateTime newDate) {
    focusedDay.value = newDate;
  }

  Future<void> getLine(DateTime focusedDay) async {
    var todayPage = await pageDao.getPageByDate(dateFormat.format(focusedDay));
    lineList.clear();
    if(todayPage != null){
      lineDao.watchLineByPageId(todayPage.id).listen((data) {
        lineList.assignAll(data);
      });
    }
  }

  onChangeName(value) {
    name.value = value;
    loadNutrition(value);
  }

  loadNutrition(String key) async {
    nutritionList.value = await nutritionsDao.searchNutrition(key);
    print(nutritionList.value);
  }

}