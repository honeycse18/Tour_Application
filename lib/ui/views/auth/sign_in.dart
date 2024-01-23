import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tour_app/business_logic/auth.dart';
import 'package:tour_app/const/app_colors.dart';
import 'package:tour_app/ui/styles/styles.dart';

import '../../route/routes.dart';
import '../../widgets/violetButton.dart';

class SignIn extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 80.h),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
                decoration: AppStyles().textFieldDecoration('E-mail Address'),
              ),
              TextFormField(
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                decoration: AppStyles().textFieldDecoration('Password'),
              ),
              SizedBox(
                height: 40.h,
              ),
              VioletButton(
                "Log In",
                () => Auth().login(
                    _emailController.text, _passwordController.text, context),
              ),
              SizedBox(
                height: 10.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "--OR--",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
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
                              color: AppColors.violetColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.toNamed(signup)),
                    ])),
              )
            ],
          ),
        ),
      )),
    );
  }
}
