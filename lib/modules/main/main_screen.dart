import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_tracking/features/dashboard/dashboard_screen.dart';
import 'package:health_tracking/modules/main/main_controller.dart';
import 'package:health_tracking/modules/scan/camera_screen.dart';
import 'package:sizer/sizer.dart';

class MainScreen extends GetWidget<MainController> {
  const MainScreen({Key? key}) : super(key: key);

  final screen = const <Widget>[
    DashboardScreen(),
    DashboardScreen(),
    DashboardScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
          index: controller.currentIndex.value,
          children: screen,
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavyBar(
          selectedIndex: controller.currentIndex.value,
          onItemSelected: (newIndex) => controller.changeCurrentIndex(newIndex),
          items: [
            BottomNavyBarItem(
              icon: const Icon(Icons.home_rounded),
              title: Text(
                'Dashboard', //Có thông tin cơ bản con chó, rồi mấy cái số liệu ba xàm ba láp cho vào đây
                style: GoogleFonts.openSans(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.home_rounded),
              title: Text(
                'Schedule', //Có mấy cái lịch ăn uống rồi suggest món j j đấy. Ae nghĩ cái tên j hay hay bỏ vào nhá
                style: GoogleFonts.openSans(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.home_rounded),
              title: Text(
                'Blog', //Cái bài đăng á, cái này vào đọc đk nếu có mạng, muốn đăng bài thì force ra đăng nhập
                style: GoogleFonts.openSans(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
            //Ae ai có j muốn thêm thì góp ý nhá
          ],
        ),
      ),
    );
  }

}