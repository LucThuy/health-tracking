// import 'package:flutter/material.dart';
//     import 'package:get/get.dart';
//     import 'package:health_tracking/routes/app_pages.dart';
//     import 'package:http/http.dart';
//     import 'package:sizer/sizer.dart';
//
//     Future<void> main() async {
//       runApp(const MyApp());
//     }
//
//     class MyApp extends StatelessWidget {
//     const MyApp({Key? key}) : super(key: key);
//
//     @override
//     Widget build(BuildContext context) {
//     return Sizer(builder: (context, orientation, deviceType) {
//     return GetMaterialApp(
//     title: "Health Tracking",
//     initialBinding: BindingsBuilder.put(() => Client()),
//     initialRoute: AppPages.initial,
//     theme: ThemeData(
//     primarySwatch: Colors.green,
//     ),
//     getPages: AppPages.routes,
//     );
//     });
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'services/auth.dart';
import 'model/FirebaseUser.dart';
import 'features/wrapper.dart';
void main() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDtxK2-RQY32LDGQRyLw3Ubk5eqO83bwR8",
            appId: "151085429342",
            messagingSenderId: "151085429342",
            projectId: "health-tracking-12433",
        ),
    );
    runApp(MyApp());
}

class MyApp extends StatelessWidget{
    @override
    Widget build(BuildContext context) {

        return StreamProvider<FirebaseUser?>.value(
            value: AuthService().user,
            initialData: null,
            child: MaterialApp(
                theme: ThemeData(
                    brightness: Brightness.light,
                    primaryColor: Colors.black,
                    buttonTheme: ButtonThemeData(
                        buttonColor: Colors.black,
                        textTheme: ButtonTextTheme.primary,
                        colorScheme:
                        Theme.of(context).colorScheme.copyWith(secondary: Colors.white),
                    ),
                    fontFamily: 'Georgia',
                    textTheme: const TextTheme(
                        headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
                        headline6: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
                        bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
                    ),
                ),
                home: Wrapper(),
            ),);

    }
}