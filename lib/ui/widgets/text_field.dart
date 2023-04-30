import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget text_field(
  _Controller,
  name,
) {
  return Container(
    child: TextField(
      controller: _Controller,
      decoration: InputDecoration(
        focusedBorder: null,
        enabled: true,
        hintText: name,
        hintStyle: TextStyle(
          fontSize: 18.sp,
          color: Colors.grey,
        ),
      ),
    ),
  );
}
