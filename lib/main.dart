import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tour_app/ui/route/onboarding.dart';
import 'package:tour_app/ui/route/routes.dart';
import 'const/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(App());
}

class App extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
    // name: "Tour_App",
    options: FirebaseOptions(
        apiKey: 'AIzaSyC06yp9OOO73z_nU9KpjNAYfgMxJfhsoA8',
        appId: '1:51924670412:android:a99267efb7f3480f2a6f69',
        projectId: 'tour-app-498ef',
        messagingSenderId: '51924670412'),
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: ((context, snapshot) {
        //check for error 
        if (snapshot.hasError) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        //once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }
        //otherwise, show something whilst waiting for initialization to complete
        return Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(428, 926),
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: AppColor.backgroundColor,
            textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme.apply(),
            ),
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: splash,
          getPages: getPages,
          // home: Splash(),
        );
      },
    );
  }
}
