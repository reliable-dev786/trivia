import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quiz_app/app/modules/controllers/simple_mode_controller.dart';
import 'package:quiz_app/app/modules/views/simple_mode_view.dart';

import '../../res/app_string.dart';
import '../../res/constants.dart';
import '../../routes/app_pages.dart';
import '../../utils/widgets/curve_button.dart';
import '../../utils/widgets/custom_button.dart';


class MainView extends GetView<SimpleModeController> {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Images.appLogo,
              height: Get.height * 0.2,
            ),
            const SizedBox(height: 48),
            CurveButton.button(
                title: AppString.simpleMode,
                onTap: () {
                  controller.mode="Simple mode";
                  Get.toNamed(Routes.SIMPLE_MODE,);
                },
                width: Get.width),
            const SizedBox(height: 28),
            CustomButton.radiusButton(
                onTap: () {
                  controller.mode="Quick mode";
                  controller.getQuestionQuick();
                }, title: AppString.quickMode, width: Get.width)
          ],
        ),
      ),
    );
  }
}
