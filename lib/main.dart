import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_tracking/modules/main/main_screen.dart';
import 'package:health_tracking/routes/app_pages.dart';
import 'package:http/http.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  List<CameraDescription> cameras = await availableCameras();
  runApp(MyApp(cameras: cameras));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required List<CameraDescription> cameras}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: "Health Tracking",
        initialBinding: BindingsBuilder.put(() => Client()),
        initialRoute: AppPages.initial,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        getPages: AppPages.routes,
      );
    });
  }
}
