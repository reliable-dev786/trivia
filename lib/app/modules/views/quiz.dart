import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quiz_app/app/res/colors.dart';
import '../../utils/widgets/custom_button.dart';
import '../../utils/widgets/dialog.dart';
import '../controllers/simple_mode_controller.dart';

class QuizView extends GetView<SimpleModeController> {
  const QuizView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.multipleChoiceAnswers.clear();
        controller.currentQuestion.value = 0;
        controller.multipleChoiceModel.results!.clear();
        return true;
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Obx(
                () => Column(
                  children: [
                    const Text(
                      "Multiple Choice Quiz",
                      style: TextStyle(
                          color: AppColor.secondaryColor,
                          fontSize: 32,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ).marginOnly(
                        bottom: Get.height * 0.07, top: Get.height * 0.05),
                    Text(
                      "Remaining time 00:0${controller.start.value}",
                      style: const TextStyle(color: AppColor.dialogColor),
                    ).marginOnly(bottom: 20),
                    RichText(
                      text: TextSpan(
                        text: '${controller.currentQuestion.value + 1}. ',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColor.dialogColor,
                          fontSize: 18,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: controller
                                .multipleChoiceModel
                                .results![controller.currentQuestion.value]
                                .question,
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: AppColor.dialogColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Get.height * 0.05),
                    ...List.generate(
                      controller
                          .multipleChoiceModel
                          .results![controller.currentQuestion.value]
                          .incorrectAnswers!
                          .length,
                      (index) => InkWell(
                        onTap: () {
                          if (controller.multipleChoiceAnswers.isEmpty) {
                            controller.multipleChoiceAnswers.add(index);
                          } else {
                            if (controller.multipleChoiceAnswers.length - 1 >=
                                controller.currentQuestion.value) {
                              // if(controller.multipleChoiceAnswers[controller.currentQuestion.value]==index) {
                              //   controller.multipleChoiceAnswers.removeAt(controller.currentQuestion.value);
                              // }
                              // else{
                              controller.multipleChoiceAnswers[
                                  controller.currentQuestion.value] = index;
                              // controller.multipleChoiceAnswers.add(index);
                              // }
                            } else {
                              controller.multipleChoiceAnswers.add(index);
                            }
                          }
                          print(controller.multipleChoiceAnswers);
                        },
                        child: Container(
                          width: Get.width,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: controller.changeSelectedColor(index)
                                  ? AppColor.secondaryColor
                                  : AppColor.dialogColor),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: controller.changeSelectedColor(index)
                                        ? AppColor.primaryColor
                                        : AppColor.secondaryColor,
                                    shape: BoxShape.circle),
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                  controller.getString(index),
                                  style: const TextStyle(
                                      color: AppColor.dialogColor,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Flexible(
                                child: Text(
                                  controller
                                      .multipleChoiceModel
                                      .results![
                                          controller.currentQuestion.value]
                                      .incorrectAnswers![index],
                                  style: TextStyle(
                                      fontSize: 16,
                                      color:
                                          controller.changeSelectedColor(index)
                                              ? AppColor.dialogColor
                                              : AppColor.primaryColor),
                                ),
                              ),
                            ],
                          ),
                        ).marginOnly(bottom: 12),
                      ),
                    ),
                    SizedBox(height: Get.height * 0.05),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton.radiusButton(
                          title: 'Previous',
                          width: Get.width * 0.3,
                          onTap: () {
                            if (controller.currentQuestion.value > 0) {
                              controller.currentQuestion.value--;
                            } else {
                              Get.snackbar(
                                'Information',
                                'You already on first question',
                                snackPosition: SnackPosition.TOP,
                                margin: const EdgeInsets.all(15),
                                backgroundColor: AppColor.informationColor,
                                colorText: AppColor.whiteColor,
                              );
                            }
                          },
                        ),
                        CustomButton.radiusButton(
                          title: 'Next',
                          width: Get.width * 0.3,
                          onTap: () {
                            if (controller.multipleChoiceAnswers.length >
                                controller.currentQuestion.value) {
                              if (controller.currentQuestion.value <
                                  controller
                                          .multipleChoiceModel.results!.length -
                                      1) {
                                controller.currentQuestion.value++;
                              } else {
                                print(controller.calculateScore());
                                CustomDialog.showMyDialog(context,
                                    totalQuestions: 10.toString(),
                                    correctQuestions: 8.toString(), onTap: () {
                                  Get.back();
                                  Get.back();
                                  controller.multipleChoiceAnswers.clear();
                                  controller.currentQuestion.value = 0;
                                  controller.multipleChoiceModel.results!
                                      .clear();
                                });
                              }
                            } else {
                              Get.snackbar(
                                'Warning',
                                'Select one option',
                                snackPosition: SnackPosition.TOP,
                                margin: const EdgeInsets.all(15),
                                backgroundColor: AppColor.redColor,
                                colorText: AppColor.whiteColor,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
