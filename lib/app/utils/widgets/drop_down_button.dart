import 'package:flutter/material.dart';

import '../../res/colors.dart';
import '../../res/constants.dart';

class CustomDropDownButton {
  static Widget button(
      {required List<String> items,
      void Function(Object?)? onChanged,
      FormFieldValidator? validator,
      String? hintText}) {
    return DropdownButtonFormField(
      dropdownColor: AppColor.secondaryColor,
      icon: Opacity(
          opacity: 0.7,
          child: Image.asset(
            Images.arrowDown,
            height: 8,
            color: AppColor.dialogColor,
          )),
      validator: validator,
      style: const TextStyle(
          fontSize: 18.0,
          color: AppColor.primaryColor,
          fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 17, vertical: 15),
        labelText: hintText,
        labelStyle: const TextStyle(
            color: AppColor.dialogColor,
            fontSize: 18,
            fontWeight: FontWeight.w400),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: AppColor.dialogColor,
              strokeAlign: StrokeAlign.outside,
              width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: AppColor.dialogColor,
              strokeAlign: StrokeAlign.outside,
              width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
              color: AppColor.dialogColor,
              strokeAlign: StrokeAlign.outside,
              width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
        ),
      ),
      isExpanded: true,
      items: items.map((value) {
        return DropdownMenuItem(
          value: value,
          child: Text(
            value,
            style: const TextStyle(color: AppColor.dialogColor),
          ),
        );
      }).toList(),
      onChanged: onChanged,
      alignment: AlignmentDirectional.topCenter,
    );
  }
}
