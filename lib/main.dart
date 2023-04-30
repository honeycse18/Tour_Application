import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tour_app/ui/route/onboarding.dart';
import 'package:tour_app/ui/route/test.dart';

import 'const/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/splash': (_) => Splash(),
            //  '/onboarding': (_) => Onboarding(),
            // '/radiobutton': (_) => RadiButtonScreen(),
            // '/register': (_) => Register(),
            // '/login': (_) => login(),
            // '/loginSignup': (_) => LoginSignUp(),
            // '/otp': (_) => Otp_Page(),
            // '/weldone': (_) => WellDone(),
            // '/bottomNavBar': (_) => Bottom_Nav_Controller(),
            // '/subcategory': (_) => SubCategory(),
            // '/productDetails': (_) => ProductDetails(),
            // '/chooseImage':(_)=>ChooseImage(),
          },
          initialRoute: '/splash',
        );
      },
    );
  }
}

//error ta kon screen e dekhasse..login koren
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.push(
            context, CupertinoPageRoute(builder: (_) => Onboarding())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo/app-logo.png',
              height: 279.h,
              width: 279.w,
            ),
          ],
        ),
      ),
    );
  }
}
