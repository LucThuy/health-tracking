import 'package:get/get.dart';
import 'package:health_tracking/local/database/nutritions_database.dart';
import 'package:intl/intl.dart';

import '../../local/page/page.dart';

class MainController extends GetxController {
  final DateFormat dateFormat = DateFormat('yMd');
  final DateTime currentDate = DateTime.now();
  final PageDao pageDao = Get.find();
  final NutritionsDao nutritionsDao = Get.find();
  final currentIndex = 0.obs;

  void changeCurrentIndex(int newIndex) {
    currentIndex.value = newIndex;
  }

  MainController();

  @override
  Future<void> onInit() async {
    super.onInit();
    await nutritionsDao.syncFirebaseData();
  }
}