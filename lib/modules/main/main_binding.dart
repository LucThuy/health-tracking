import 'package:get/get.dart';
import 'package:health_tracking/features/dashboard/dashboard_controller.dart';
import 'package:health_tracking/features/diary/diary_controller.dart';
import 'package:health_tracking/features/plan/plan_controller.dart';
import 'package:health_tracking/local/database/nutritions_database.dart';
import 'package:health_tracking/local/line/line.dart';
import 'package:health_tracking/local/page/page.dart';
import 'package:health_tracking/modules/image/image_controller.dart';
import 'package:health_tracking/modules/main/main_controller.dart';

import '../../features/nutrition/nutrition_controller.dart';
import '../../local/database/daily_plan.dart';
import '../../local/database/plan.dart';
import '../scan/scan_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<ScanController>(() => ScanController());
    Get.lazyPut<ImageController>(() => ImageController());

    Get.lazyPut<LineDao>(() => LineDao(LineDatabase()));
    Get.lazyPut<PageDao>(() => PageDao(PageDatabase()));
    Get.lazyPut<DiaryController>(() => DiaryController());
    Get.lazyPut<NutritionController>(() => NutritionController());
    Get.lazyPut<PlanController>(() => PlanController());
    Get.lazyPut<NutritionsDao>(() => NutritionsDao(NutritionsDatabase()));
    Get.lazyPut<PlanDao>(() => PlanDao(PlanDatabase()));
    Get.lazyPut<DailyPlanDao>(() => DailyPlanDao(DailyPlanDatabase()));
  }

}