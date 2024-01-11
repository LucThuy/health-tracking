import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_tracking/features/blog/blog_screen.dart';
import 'package:health_tracking/features/dashboard/dashboard_screen.dart';
import 'package:health_tracking/features/diary/diary_screen.dart';
import 'package:health_tracking/modules/main/main_controller.dart';
import 'package:health_tracking/utility/theme.dart';
import 'package:sizer/sizer.dart';

class MainScreen extends GetWidget<MainController> {
  MainScreen({Key? key}) : super(key: key);

  final screen = <Widget>[DashboardScreen(), DiaryScreen(), BlogPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: screen,
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavyBar(
          selectedIndex: controller.currentIndex.value,
          onItemSelected: (newIndex) => controller.changeCurrentIndex(newIndex),
          backgroundColor: kGreen800,
          showElevation: true,
          items: [
            BottomNavyBarItem(
                icon: const Icon(Icons.home_rounded, color: kWhite),
                title: Text(
                  'Dashboard',
                  //Có thông tin cơ bản con chó, rồi mấy cái số liệu ba xàm ba láp cho vào đây
                  style: GoogleFonts.pangolin(
                    color: kWhite,
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp,
                  ),
                ),
                activeColor: kGreen600),
            BottomNavyBarItem(
                icon: const Icon(Icons.book_rounded, color: kWhite),
                title: Text(
                  'Diary',
                  //Có mấy cái lịch ăn uống rồi suggest món j j đấy. Ae nghĩ cái tên j hay hay bỏ vào nhá
                  style: GoogleFonts.pangolin(
                    color: kWhite,
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp,
                  ),
                ),
                activeColor: kGreen600),
            BottomNavyBarItem(
                icon: const Icon(Icons.library_books_rounded, color: kWhite),
                title: Text(
                  'Blog',
                  //Cái bài đăng á, cái này vào đọc đk nếu có mạng, muốn đăng bài thì force ra đăng nhập
                  style: GoogleFonts.pangolin(
                    color: kWhite,
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp,
                  ),
                ),
                activeColor: kGreen600)
            //Ae ai có j muốn thêm thì góp ý nhá
          ],
        ),
      ),
    );
  }
}
