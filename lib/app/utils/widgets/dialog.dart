import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/app/res/app_string.dart';
import 'package:quiz_app/app/res/colors.dart';

import 'custom_button.dart';

class CustomDialog {
  static Future<void> showMyDialog(
    BuildContext context, {
    required String totalQuestions,
    required String correctQuestions,
        required VoidCallback onTap,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColor.dialogColor,
          content: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
              child: Column(
                children: [
                  const Text(
                    AppString.quizCompleted,
                    style: TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'you attempt ',
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        color: AppColor.primaryColor,
                        fontSize: 18,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '$totalQuestions questions',
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                            color: AppColor.secondaryColor,
                          ),
                        ),
                        const TextSpan(
                          text: 'and from that ',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                            color: AppColor.primaryColor,
                          ),
                        ),
                        TextSpan(
                          text: '$correctQuestions answers ',
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                            color: Colors.green,
                          ),
                        ),
                        const TextSpan(
                          text: 'is correct ',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                            color: AppColor.dialogColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            CustomButton.radiusButton(title: "OK",onTap: onTap,
              width: Get.width*0.3
            ).marginOnly(right: 8)
          ],
        );
      },
    );
  }
}
