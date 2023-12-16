import 'package:get/get.dart';
import 'package:health_tracking/features/dashboard/dashboard_controller.dart';
import 'package:health_tracking/features/diary/diary_controller.dart';
import 'package:health_tracking/local/line/line.dart';
import 'package:health_tracking/modules/main/main_controller.dart';

import '../scan/scan_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<ScanController>(() => ScanController());

    Get.lazyPut<LineDao>(() => LineDao(LineDatabase()));
    Get.lazyPut<DiaryController>(() => DiaryController());
  }

}