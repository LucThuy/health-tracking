import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../../../local/database/nutritions_database.dart';
import '../../local/database/daily_plan.dart';
import '../../local/database/plan.dart';
import 'detail_plan_controller.dart';


class DetailPlanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailPlanController>(() => DetailPlanController());

    Get.lazyPut<PlanDao>(() => PlanDao(PlanDatabase()));
    Get.lazyPut<DailyPlanDao>(() => DailyPlanDao(DailyPlanDatabase()));
    Get.lazyPut<NutritionsDao>(() => NutritionsDao(NutritionsDatabase()));
  }
}