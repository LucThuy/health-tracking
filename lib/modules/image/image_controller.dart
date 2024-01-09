import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:health_tracking/routes/app_pages.dart';

class ImageController extends GetxController {
  late List<CameraDescription> cameras;
  late CameraController cameraController;
  final RxBool initialize = RxBool(false);

  Future<void> initCamera() async {
    cameras = await availableCameras();
    cameraController = CameraController(cameras[0], ResolutionPreset.ultraHigh);
    cameraController.initialize().then((value) {
      initialize.value = true;
      initialize.refresh();
    });
  }

  @override
  void dispose() {
    initialize.value = false;
    cameraController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    initCamera();
    super.onInit();
  }

  Future<void> takeImage() async {
    final image = await cameraController.takePicture();
    Get.offNamed(AppRoutes.rAddLine, arguments: {'image': image.path});
    Get.until((route) => route.isFirst);
  }
}