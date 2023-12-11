import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tour_app/ui/styles/styles.dart';

Widget FormField(controller, inputType, hint) {
  return TextField(
    keyboardType: inputType,
    controller: controller,
    decoration: AppStyle().textFieldDecoration(hint),
  );
}
