import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../local/page/page.dart';

class MainController extends GetxController {
  final DateFormat dateFormat = DateFormat('yMd');
  final DateTime currentDate = DateTime.now();
  final PageDao pageDao = Get.find();
  final currentIndex = 0.obs;

  void changeCurrentIndex(int newIndex) {
    currentIndex.value = newIndex;
  }

  MainController();
}