import 'package:flutter/cupertino.dart';

import 'components/camera_viewer.dart';
import 'components/capture_button.dart';
import 'components/top_image_viewer.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [CameraViewer(), CaptureButton(), TopImageViewer()],
    );
  }
}
