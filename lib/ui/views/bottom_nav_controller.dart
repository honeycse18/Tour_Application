import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BottomNavController extends StatelessWidget {
  RxInt _currentIndex = 0.obs;
  RxBool _Drawer = false.obs;
  final _pages = [
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.black,
    ),
    Container(
      color: Colors.yellow,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedPositioned(
          duration: Duration(
            milliseconds: 400,
          ),
          top: _Drawer.value == false ? 0 : 100.h,
          bottom: _Drawer.value == false ? 0 : 100.h,
          left: _Drawer.value == false ? 0 : 200.w,
          right: _Drawer.value == false ? 0 : -100.w,
          child: Container(
            decoration: BoxDecoration(),
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: _Drawer.value == false
                    ? IconButton(
                        onPressed: () {
                          _Drawer.value = true;
                        },
                        icon: Icon(
                          Icons.menu,
                          color: Colors.black,
                        ))
                    : IconButton(
                        onPressed: () {
                          _Drawer.value = false;
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.black,
                        )),
                title: Text("Shelter"),
              ),
              bottomNavigationBar: BottomNavigationBar(
                  onTap: ((value) => _currentIndex.value = value),
                  currentIndex: _currentIndex.value,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home_outlined), label: "Home"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.add_outlined), label: "Add"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home_outlined), label: "Home"),
                  ]),
            ),
          ),
        ));
  }
}
