import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Icon_Button extends StatelessWidget {
  Icon_Button({
    required this.onPressed,
    required this.IconSize,
    this.avaterColor,
    this.textColor,
    super.key,
    this.Icon,
    required this.iconColor,
  });

  VoidCallback onPressed;
  Color? avaterColor;
  //final BorderRadius;
  Color? textColor;

  double IconSize;

  dynamic Icon;
  Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CircleAvatar(
              backgroundColor: avaterColor,
              maxRadius: 19.r,
              child: IconButton(
                icon: Icon,
                color: iconColor,
                iconSize: IconSize,
                onPressed: onPressed,
              )),
        ],
      ),
    );
  }
}
