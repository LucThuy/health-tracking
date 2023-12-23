import 'package:get/get.dart';
import 'package:health_tracking/local/database/diary.dart';
import 'package:intl/intl.dart';

class DiaryController extends GetxController {
  Rx<DateTime> focusedDay = DateTime.now().obs;
  final DateFormat formatter = DateFormat('yMEd');
  final DiaryDao diaryDao = Get.find();

  void saveDiary(String content, DateTime date) async {
    await diaryDao.saveDiary(content, date);
  }

  void updateSelectedDay(DateTime newDate) {
    focusedDay.value = newDate;
  }

}