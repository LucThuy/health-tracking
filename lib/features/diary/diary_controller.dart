import 'package:get/get.dart';

class DiaryController extends GetxController {
  Rx<DateTime> focusedDay = DateTime.now().obs;


  void updateSelectedDay(DateTime newDate) {
    focusedDay.value = newDate;
  }

}