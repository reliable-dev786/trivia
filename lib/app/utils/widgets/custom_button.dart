import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../res/colors.dart';

class CustomButton {
  static Widget radiusButton(
      {VoidCallback? onTap,
      double height = 55,
      double width = 320,
      Color color = AppColor.secondaryColor,
        Widget? icon,
      required String title}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColor,
              spreadRadius: 3,
              blurRadius: 4,
              offset: const Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20, color: AppColor.whiteColor),
            ),
            if(icon!=null)
              icon
          ],
        ),
      ),
    );
  }
}
