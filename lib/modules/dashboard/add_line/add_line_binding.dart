import 'package:get/get.dart';
import 'package:health_tracking/local/database/nutritions_database.dart';
import 'package:health_tracking/local/page/page.dart';
import 'package:health_tracking/modules/dashboard/add_line/add_line_controller.dart';

import '../../../local/line/line.dart';

class AddLineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddLineController>(() => AddLineController());

    Get.lazyPut<LineDao>(() => LineDao(LineDatabase()));
    Get.lazyPut<PageDao>(() => PageDao(PageDatabase()));
    Get.lazyPut<NutritionsDao>(() => NutritionsDao(NutritionsDatabase()));
  }

}