import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../../../local/database/nutritions_database.dart';
import '../../../local/line/line.dart';
import '../../../local/page/page.dart';
import 'detail_line_controller.dart';

class DetailLineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailLineController>(() => DetailLineController());

    Get.lazyPut<LineDao>(() => LineDao(LineDatabase()));
    Get.lazyPut<PageDao>(() => PageDao(PageDatabase()));
    Get.lazyPut<NutritionsDao>(() => NutritionsDao(NutritionsDatabase()));
  }
}