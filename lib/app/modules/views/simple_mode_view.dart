import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quiz_app/app/modules/views/quiz.dart';
import 'package:quiz_app/app/res/app_string.dart';
import 'package:quiz_app/app/res/colors.dart';
import 'package:quiz_app/app/services/api_services.dart';

import '../../utils/widgets/custom_button.dart';
import '../../utils/widgets/custom_textfield.dart';
import '../../utils/widgets/drop_down_button.dart';
import '../controllers/simple_mode_controller.dart';

class SimpleModeView extends GetView<SimpleModeController> {
  const SimpleModeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Trivia",
              style: TextStyle(
                  color: AppColor.dialogColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 36),
            ),
            SizedBox(
              height: Get.height * 0.08,
            ),
            TextFieldCustom.textField(
                textEditingController: controller.numberOfQuestions,
                hntText: AppString.numberOfQuestion,
                keyBoardType: TextInputType.number),
            CustomDropDownButton.button(
              items: controller.categoryList,
              onChanged: (value) {
                controller.category = value.toString();
              },
              hintText: AppString.selectCategory,
            ).marginOnly(top: 26),
            CustomDropDownButton.button(
              items: controller.difficultyList,
              onChanged: (value) {
                controller.difficulty = value.toString();
              },
              hintText: AppString.anyDifficulty,
            ).marginOnly(top: 26),
            CustomDropDownButton.button(
              items: controller.selectTypeList,
              onChanged: (value) {
                controller.type = value.toString();
              },
              hintText: AppString.selectType,
            ).marginOnly(top: 26),
            SizedBox(
              height: Get.height * 0.08,
            ),
            CustomButton.radiusButton(
                title: AppString.search,
                onTap: () {
                 controller.getQuestion();
                })
          ],
        ),
      ),
    ));
  }
}
