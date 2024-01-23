import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tour_app/ui/route/routes.dart';
import 'package:tour_app/ui/views/bottom_nav_pages/pages/nav_add.dart';
import 'package:tour_app/ui/views/bottom_nav_pages/pages/nav_favourite.dart';
import 'package:tour_app/ui/views/bottom_nav_pages/pages/nav_home.dart';

class BottomNavController extends StatelessWidget {
  RxInt _currentIndex = 0.obs;
  RxBool _Drawer = false.obs;
  final _pages = [NavHome(), NavAdd(), NavFavourite()];

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
                        icon: Icon(Icons.favorite_outline), label: "Favourite"),
                  ]),
              body: _pages[_currentIndex.value],
            ),
          ),
        ));
  }
}
