import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tour_app/const/colors.dart';

// class CustomButton extends StatelessWidget {
//   CustomButton(
//       {required this.onTap,
//       // this.BorderRadius,
//       this.buttonColor,
//       this.textColor,
//       required this.buttonText,
//       super.key,
//       required TextStyle style,
//       required this.topright,
//       required this.topleft,
//       required this.height,
//       required this.width,
//       required this.bottomleft,
//       required this.bottomright,
//       required this.borderColor});

//   VoidCallback onTap;
//   Color? buttonColor;
//   //final BorderRadius;
//   Color? textColor;
//   String buttonText;
//   var style;
//   double topright;
//   double topleft;
//   double height;
//   double width;
//   double bottomright;
//   double bottomleft;
//   Color borderColor;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width,
//       height: height,
//       decoration: BoxDecoration(
//         color: buttonColor ?? Colors.grey,
//         border: Border.all(color: borderColor, width: 2.0),
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(topleft),
//           topRight: Radius.circular(topright),
//           bottomLeft: Radius.circular(bottomleft),
//           bottomRight: Radius.circular(bottomright),
//         ),
//       ),
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           onTap: onTap,
//           child: Container(
//             padding: const EdgeInsets.only(left: 20, right: 20),
//             child: Center(
//               child: Text(
//                 buttonText,
//                 style: TextStyle(
//                   color: textColor,
//                   fontSize: 16.sp,
//                   fontWeight: FontWeight.bold,
//                   //fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class VioletButton extends StatelessWidget {
  RxBool _value = false.obs;
  final Function onAction;
  String title;
  VioletButton(this.title, this.onAction);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: () {
          _value.value = true;
          onAction();
        },
        child: Container(
            height: 45.h,
            decoration: BoxDecoration(
              color: AppColor.purple,
              borderRadius: BorderRadius.all(Radius.circular(5.r)),
            ),
            child: _value == false
                ? Center(
                    child: Text(
                      title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.sp,
                          color: Colors.white),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Please Wait",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.sp,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Transform.scale(
                          scale: 0.4,
                          child: CircularProgressIndicator(color: Colors.white))
                    ],
                  )),
      ),
    );
  }
}
