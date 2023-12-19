import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tour_app/ui/route/onboarding.dart';
import 'package:tour_app/ui/route/routes.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final box = GetStorage();
  Future chooseScreen() async {
    var userId = box.read('uid');
    print(userId);
    if (userId == null) {
      Get.toNamed(onboarding);
    } else {
      Get.toNamed(homepage);
    }
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () => chooseScreen());
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
