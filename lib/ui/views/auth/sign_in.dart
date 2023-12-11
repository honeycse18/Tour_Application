import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tour_app/const/colors.dart';
import 'package:tour_app/ui/styles/styles.dart';
import 'package:tour_app/ui/widgets/button.dart';

import '../../route/routes.dart';

class SignIn extends StatelessWidget {
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
              "Login\nTo Your Account",
              style: TextStyle(fontSize: 36.sp, fontWeight: FontWeight.bold),
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
            VioletButton("Log In",() => Get.toNamed(userform),),
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
                      text: 'Don’t have registered yet?',
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black26),
                      children: [
                    TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColor.purple),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => print('Clicked')),
                  ])),
            )
          ],
        ),
      )),
    );
  }
}