import 'package:get/get.dart';
import 'package:health_tracking/modules/dashboard/add_line/add_line_controller.dart';

class AddLineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddLineController>(() => AddLineController());
  }

}