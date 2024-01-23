import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:launch_review/launch_review.dart';
import 'package:tour_app/ui/route/routes.dart';
import 'package:tour_app/ui/widgets/drawer_item.dart';
import '../../route/routes.dart';

class Drawer_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, top: 50.h, bottom: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Shelter",
              style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w500),
            ),
            Text(
              "Travel Agency",
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 20.h,
            ),
            drawerItem(
              "Support",
              () {
                Get.toNamed(support);
              },
            ),
            drawerItem(
              "Privacy",
              () {
                Get.toNamed(privacy);
              },
            ),
            drawerItem(
              "FAQ",
              () {
                Get.toNamed(faq);
              },
            ),
            // drawerItem(
            //     "Rate Us",
            //     () =>
            //         LaunchReview.launch(androidAppId: "com.example.tour_app")),
            drawerItem(
              "How to use",
              () {
                Get.toNamed(howtouse);
              },
            ),
            Expanded(
              child: SizedBox(),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(settings);
              },
              child: Text(
                "Settings",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }
}
