import 'package:get/get.dart';
import 'package:health_tracking/features/dashboard/dashboard_controller.dart';
import 'package:health_tracking/local/line/line.dart';
import 'package:health_tracking/modules/main/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<DashboardController>(() => DashboardController());

    Get.lazyPut<LineDao>(() => LineDao(LineDatabase()));
  }

}