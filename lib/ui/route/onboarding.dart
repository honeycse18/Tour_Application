import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../const/colors.dart';

import '../widgets/button.dart';
import '../widgets/icon_button.dart';

class Onboarding extends StatefulWidget {
  Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  List items = [
    {
      'image': 'assets/images/onboarding-1.png',
      'title': 'Welcome',
      'description':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
    },
    {
      'image': 'assets/images/onboarding-2.png',
      'title': 'Categories',
      'description':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'
    },
    {
      'image': 'assets/images/onboarding-3.png',
      'title': 'Support',
      'description':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'
    },
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
          child: Center(
              child: Column(
        children: [
          Container(
            height: 430.h,
            width: double.infinity,
            child: Center(
              child: Image.asset(
                items[currentIndex]['image'],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 300.h,
              width: 400.w,
              decoration: BoxDecoration(
                color: AppColor.backgroundColor,
                //DecorationImage
                border: Border.all(
                    color: Color.fromARGB(255, 241, 240, 247),
                    width: 3.0,
                    style: BorderStyle.solid), //Border.all

                borderRadius: BorderRadius.circular(20.0),

                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(211, 209, 209, 1),
                    offset: const Offset(
                      5.0,
                      5.0,
                    ),
                    blurRadius: 8.0,
                    spreadRadius: 8.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 2.0,
                    spreadRadius: 2.0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      width: double.maxFinite,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10, left: 35, right: 35),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30.h,
                            ),
                            Text(
                              items[currentIndex]['title'],
                              style: TextStyle(
                                  color: AppColor.deep_grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.sp),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Text(
                              items[currentIndex]['description'],
                              style: TextStyle(
                                  color: Color.fromARGB(255, 143, 142, 142),
                                  fontSize: 18.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DotsIndicator(
                          dotsCount: items.length,
                          position: currentIndex.toDouble(),
                          decorator: const DotsDecorator(
                              color: Colors.grey, activeColor: Colors.black),
                        ),
                        Container(
                          width: 45.w,
                          height: 45.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60.0),
                              color: AppColor.backgroundColor,
                              border: Border.all(
                                  color: Colors.white,
                                  width: 3.w,
                                  style: BorderStyle.solid),
                              boxShadow: [
                                //BoxShadow
                                BoxShadow(
                                  color: Colors.white,
                                  offset: const Offset(
                                    0.0,
                                    0.0,
                                  ),
                                  blurRadius: 6.0,
                                  spreadRadius: 4.0,
                                ),
                              ]),
                          child: Icon_Button(
                            IconSize: 25,
                            iconColor: Colors.black,
                            avaterColor: Colors.white,
                            onPressed: () {
                              if (currentIndex < 2) {
                                setState(() {});
                                currentIndex++;
                              } else
                                Navigator.pushNamed(context, '/splash');
                            },
                            Icon: Icon(Icons.keyboard_double_arrow_right_sharp),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ))),
    );
  }
}
