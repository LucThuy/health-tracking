import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'image_controller.dart';

class ImageScreen extends GetView<ImageController> {
  const ImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Obx(() {
          if (!controller.initialize.value) {
            return Container();
          }
          return SizedBox(
              height: Get.height,
              width: Get.width,
              child: CameraPreview(controller.cameraController));
        }),
        Positioned(
          bottom: 30,
          child: GestureDetector(
            onTap: () => controller.takeImage(),
            child: Container(
              height: 80,
              width: 80,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  border: Border.all(color: Colors.white, width: 5)),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
