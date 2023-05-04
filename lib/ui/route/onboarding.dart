import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:tour_app/ui/route/routes.dart';
import '../../const/colors.dart';

import '../styles/styles.dart';
import '../widgets/button.dart';
import '../widgets/icon_button.dart';

class Onboarding extends StatelessWidget {
  Onboarding({super.key});

  // List items = [
  List<String> _lottieFiles = [
    'assets/files/welcome.json',
    'assets/files/categories.json',
    'assets/files/support.json',
  ];

  List<String> _title = ['Welcome', 'Categories', 'Support'];

  List<String> _descriptions = [
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'
  ];

  RxInt currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(children: [
          Obx(
            () => Expanded(
                flex: 2,
                child: Lottie.asset(_lottieFiles[currentIndex.toInt()])),
          ),
          Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColor.backgroundColor,
                    borderRadius: BorderRadius.circular(10.r),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(4.0, 4.0),
                          blurRadius: 10,
                          spreadRadius: 1.0),
                      BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4.0, -4.0),
                          blurRadius: 5,
                          spreadRadius: 1.0)
                    ]),
                child: Padding(
                  padding: EdgeInsets.all(30.w),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() => Text(
                              '${_title[currentIndex.toInt()]}',
                              style: AppStyle().myTextStyle,
                            )),
                        Obx(
                          () => Text('${_descriptions[currentIndex.toInt()]}'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => DotsIndicator(
                                dotsCount: _lottieFiles.length,
                                position: currentIndex.toDouble(),
                                decorator: DotsDecorator(),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if (currentIndex == 2) {
                                  print('Finished');
                                } else {
                                  currentIndex + 1;
                                }
                              },
                              child: Container(
                                height: 37.h,
                                width: 37.w,
                                decoration: BoxDecoration(
                                    color: AppColor.backgroundColor,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(4.0, 4.0),
                                      ),
                                    ]),
                              ),
                            ),
                          ],
                        )
                      ]),
                ),
              )),
        ]),
      )),
    );
  }
}

/*
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
                    color: Color.fromARGB(255, 207, 206, 206),
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 5.0,
                    spreadRadius: 5.0,
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
                                  color: AppColor.backgroundColor,
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
                                Get.toNamed(splash);
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
        
 */