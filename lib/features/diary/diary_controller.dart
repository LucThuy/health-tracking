import 'package:get/get.dart';
import 'package:health_tracking/local/database/diary.dart';
import 'package:intl/intl.dart';

import '../../routes/app_pages.dart';

class DiaryController extends GetxController {
  Rx<DateTime> focusedDay = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).toUtc().add(Duration(hours: 7)).obs;
  final DateFormat formatter = DateFormat('yMEd');
  final DiaryDao diaryDao = Get.find();

  void saveDiary(String content, DateTime date) async {
    await diaryDao.saveDiary(content, date);
    Get.toNamed(AppRoutes.rMain);
  }

  void updateSelectedDay(DateTime newDate) {
    focusedDay.value = newDate;
  }

}