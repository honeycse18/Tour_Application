import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tour_app/ui/route/routes.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () => Get.toNamed(onboarding));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo/app-logo.png',
              height: 200.h,
              width: 279.w,
            ),
            Text(
              'Shelter Travel Agency',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
            ),
          ],
        ),
      ),
    );
  }
}
