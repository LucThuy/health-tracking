import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DiaryController extends GetxController {
  Rx<DateTime> focusedDay = DateTime.now().obs;
  final DateFormat formatter = DateFormat('yMEd');


  void updateSelectedDay(DateTime newDate) {
    focusedDay.value = newDate;
  }

}