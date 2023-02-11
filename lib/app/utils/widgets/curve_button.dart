import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../res/colors.dart';

class CurveButton {
  static Widget button(
      {double height = 55,
      double width = 320,
      double fontSize = 20,
        EdgeInsetsGeometry? padding,
      required String title,
      Color color = AppColor.selectedColor,
      VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(60),
            topRight: Radius.circular(60),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(color: AppColor.primaryColor, fontSize: fontSize),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
