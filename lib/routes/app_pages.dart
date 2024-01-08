import 'package:get/get.dart';
import 'package:health_tracking/modules/dashboard/add_line/add_line_binding.dart';
import 'package:health_tracking/modules/dashboard/add_line/add_line_screen.dart';
import 'package:health_tracking/modules/image/image_binding.dart';
import 'package:health_tracking/modules/main/main_binding.dart';
import 'package:health_tracking/modules/main/main_screen.dart';
import 'package:health_tracking/modules/scan/camera_screen.dart';

import '../modules/image/image_screen.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.rMain;
  static final routes = [
    GetPage(
      name: AppRoutes.rMain,
      binding: MainBinding(),
      page: () => MainScreen(),
    ),
    GetPage(
      name: AppRoutes.rCamera,
      binding: MainBinding(),
      page: () => const CameraScreen(),
    ),
    GetPage(
      name: AppRoutes.rImage,
      binding: ImageBinding(),
      page: () => const ImageScreen(),
    ),

    GetPage(
      name: AppRoutes.rAddLine,
      binding: AddLineBinding(),
      page: () => const AddLineScreen(),
    )
  ];
}