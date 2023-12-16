import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:image/image.dart';

class ScanController extends GetxController {
  late List<CameraDescription> _cameras;
  late CameraController _cameraController;
  final RxBool _isInitialized = RxBool(false);
  CameraImage? _cameraImage;
  final RxList<Uint8List> _imageList = RxList([]);

  CameraController get cameraController => _cameraController;

  bool get isInitialized => _isInitialized.value;

  List<Uint8List> get imageList => _imageList;

  @override
  void dispose() {
    _isInitialized.value = false;
    _cameraController.dispose();
    super.dispose();
  }

  Future<void> initCamera() async {
    _cameras = await availableCameras();
    _cameraController = CameraController(_cameras[0], ResolutionPreset.high,
        imageFormatGroup: ImageFormatGroup.bgra8888);
    _cameraController.initialize().then((value) {
      _isInitialized.value = true;
      _cameraController.startImageStream((image) => _cameraImage = image);

      _isInitialized.refresh();
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print('User denied camera access.');
            break;
          default:
            print('Handle other errors.');
            break;
        }
      }
    });
  }

  @override
  void onInit() {
    initCamera();
    super.onInit();
  }

  void capture() {
    if (_cameraImage != null) {
      Image image = Image.fromBytes(
          width: (_cameraImage!.planes[0].bytesPerRow / 4).round(),
          height: _cameraImage!.height,
          bytes: _cameraImage!.planes[0].bytes.buffer,
          order: ChannelOrder.bgra,
          format: Format.uint8);
      Uint8List list = Uint8List.fromList(encodeJpg(image));
      _imageList.add(list);
      _imageList.refresh();
    }
  }
}
