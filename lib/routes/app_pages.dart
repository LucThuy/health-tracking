import 'package:get/get.dart';
import 'package:health_tracking/features/blog/blog_screen.dart';
import 'package:health_tracking/modules/main/main_binding.dart';
import 'package:health_tracking/modules/main/main_screen.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.rMain;
  static final routes = [
    GetPage(
      name: AppRoutes.rMain,
      binding: MainBinding(),
      page: () => const MainScreen(),
    ),
    GetPage(
      name: AppRoutes.rBlog,
      page: () => BlogPage()
    )
  ];
}