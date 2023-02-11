import 'package:flutter/material.dart';

import '../../res/colors.dart';

class TextFieldCustom {
  static TextFormField textField(
      {required TextEditingController textEditingController,
      required String hntText,
      bool obscureText = false,
      FormFieldValidator? validator,
      Widget? suffixIcon,
      int maxLine = 1,
      TextInputType keyBoardType = TextInputType.text,
      double radius = 54,
      TextStyle textStyle = const TextStyle(
          fontSize: 18.0,
          color: AppColor.dialogColor,
          fontWeight: FontWeight.w400)}) {
    return TextFormField(
      validator: validator,
      maxLines: maxLine,
      keyboardType: keyBoardType,
      controller: textEditingController,
      autofocus: false,
      obscureText: obscureText,
      style: textStyle,
      textAlignVertical: TextAlignVertical.top,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        // labelText: hntText,
        isDense: true,
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 14),
          child: suffixIcon,
        ),
        suffixIconConstraints: const BoxConstraints(
          maxHeight: 25,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 17, vertical: 15),
        filled: true,
        // hintText: hntText,
        fillColor: Colors.transparent,
        label: Text(
          hntText,
          style: TextStyle(
            color: AppColor.dialogColor,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        // labelStyle: TextStyle(
        //   color: AppColor.primaryColor.withOpacity(0.6),
        //   fontSize: 16,
        //   fontWeight: FontWeight.w400,
        // ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColor.dialogColor,
            ),
            borderRadius: BorderRadius.circular(radius)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColor.dialogColor,
            ),
            borderRadius: BorderRadius.circular(radius)),
      ),
    );
  }
}
