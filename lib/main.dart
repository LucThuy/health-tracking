import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_tracking/routes/app_pages.dart';
import 'package:http/http.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCrOrTVGA-RyTxceQNmnQHRElxyZRBLcSA",
      appId: "624466782152",
      messagingSenderId: "624466782152",
      projectId: "health-tracking-v2",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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

// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:health_tracking/features/splash_screen.dart';
// import 'package:health_tracking/features/authenticate/home_page.dart';
// import 'package:health_tracking/features/authenticate/login_page.dart';
// import 'package:health_tracking/features/authenticate/sign_up_page.dart';
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: FirebaseOptions(
//       apiKey: "AIzaSyDtxK2-RQY32LDGQRyLw3Ubk5eqO83bwR8",
//       appId: "151085429342",
//       messagingSenderId: "151085429342",
//       projectId: "health-tracking-12433",
//     ),
//   );
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Firebase',
//       routes: {
//         '/': (context) => SplashScreen(
//           // Here, you can decide whether to show the LoginPage or HomePage based on user authentication
//           child: LoginPage(),
//         ),
//         '/login': (context) => LoginPage(),
//         '/signUp': (context) => SignUpPage(),
//         '/home': (context) => HomePage(),
//       },
//     );
//   }
// }
