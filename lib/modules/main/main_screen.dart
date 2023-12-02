import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_tracking/modules/main/main_controller.dart';
import 'package:sizer/sizer.dart';

class MainScreen extends GetWidget<MainController> {
  const MainScreen({Key? key}) : super(key: key);

  final screen = const <Widget>[

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
                'Home',
                style: GoogleFonts.openSans(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.home_rounded),
              title: Text(
                'Home',
                style: GoogleFonts.openSans(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}