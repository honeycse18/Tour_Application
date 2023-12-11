import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tour_app/const/colors.dart';
import 'package:tour_app/ui/styles/styles.dart';
import 'package:tour_app/ui/widgets/button.dart';

import '../../route/routes.dart';

class SignUp extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 80.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create\nYour Account",
              style: TextStyle(fontSize: 36.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              "Create Your Account and Start Your Journey",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 80.h,
            ),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: AppStyle().textFieldDecoration('E-mail Address'),
            ),
            TextFormField(
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              decoration: AppStyle().textFieldDecoration('Password'),
            ),
            SizedBox(
              height: 40.h,
            ),
            VioletButton(
              "Create Account",
              () => Get.toNamed(userform),
            ),
            SizedBox(
              height: 10.h,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "--OR--",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/icons/google.png',
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/icons/facebook.png',
                    )),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Align(
              alignment: Alignment.center,
              child: RichText(
                  text: TextSpan(
                      text: 'Already an user?',
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black26),
                      children: [
                    TextSpan(
                        text: 'Log in',
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColor.purple),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.toNamed(signin)),
                  ])),
            )
          ],
        ),
      )),
    );
  }
}
