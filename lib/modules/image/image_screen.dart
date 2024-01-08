import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../routes/app_pages.dart';
import '../../utility/theme.dart';
import 'image_controller.dart';

class ImageScreen extends GetView<ImageController> {
  const ImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: kGradientGreen50White,
            ),
          ),
          Obx(() {
            if (!controller.initialize.value) {
              return Container();
            }
            return Positioned(
              top: 130,
              child: SizedBox(
                height: 540,
                width: 360,
                child: Card(
                  elevation: 5,
                  shadowColor: kGreen950,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: CameraPreview(controller.cameraController),
                  ),
                ),
              ),
            );
          }),
          Positioned(
            top: 50,
            child: Center(
              child: Text(
                "TAKE IMAGE",
                style: GoogleFonts.pangolin(
                  color: kGreen800,
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp,
                ),
              ),
            ),
          ),
          // Positioned(
          //   bottom: 40,
          //   child: GestureDetector(
          //     onTap: () => controller.takeImage(),
          //     child: Container(
          //       height: 80,
          //       width: 80,
          //       padding: const EdgeInsets.all(5),
          //       decoration: BoxDecoration(
          //           shape: BoxShape.circle,
          //           color: kWhite,
          //           border: Border.all(color: kGreen800, width: 5)),
          //       child: Container(
          //         decoration: const BoxDecoration(
          //           color: kGreen800,
          //           shape: BoxShape.circle,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          Positioned(
            bottom: 25,
            child: SizedBox(
              width: 70.w,
              height: 70,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
                shadowColor: kGreen950,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) => {
                      if (direction == DismissDirection.startToEnd)
                        {controller.takeImage()}
                      else if (direction == DismissDirection.endToStart)
                        {Get.toNamed(AppRoutes.rMain)}
                    },
                    background: Container(
                      color: kGreen600,
                      child: Center(
                        child: Text(
                          "Next",
                          style: GoogleFonts.pangolin(
                            color: kWhite,
                            fontWeight: FontWeight.w700,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                    secondaryBackground: Container(
                      color: kRed600,
                      child: Center(
                        child: Text(
                          "Back",
                          style: GoogleFonts.pangolin(
                            color: kWhite,
                            fontWeight: FontWeight.w700,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                    child: Container(
                        height: 70,
                        color: kGreen800,
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.arrow_back_ios_new_rounded,
                                    color: kWhite),
                                Text(
                                  "Back",
                                  style: GoogleFonts.pangolin(
                                    color: kWhite,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Next",
                                  style: GoogleFonts.pangolin(
                                    color: kWhite,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12.sp,
                                  ),
                                ),
                                const Icon(Icons.arrow_forward_ios_rounded,
                                    color: kWhite),
                              ],
                            ),
                          ],
                        )),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
