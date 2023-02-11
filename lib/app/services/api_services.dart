import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

import '../model/multiplechoice_model.dart';
import '../res/colors.dart';

class ApiServices {
  static Future<MultipleChoiceModel> getMultipleChoice(
      {required int amount,
      required int category,
      required String difficulty,
      required String type}) async {
    print('https://opentdb.com/api.php?amount=$amount&category=$category&difficulty=$difficulty&type=$type');
    final response = await http.get(Uri.parse(
        'https://opentdb.com/api.php?amount=$amount&category=$category&difficulty=$difficulty&type=$type'));
    MultipleChoiceModel multipleChoiceModel = MultipleChoiceModel();
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      multipleChoiceModel =
          MultipleChoiceModel.fromJson(json.decode(response.body));
      return multipleChoiceModel;
    } else if (response.statusCode == 400) {
      Get.snackbar(
        'Failed',
        'Phone Verification Failed',
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.all(15),
        backgroundColor: AppColor.redColor,
        colorText: AppColor.whiteColor,
      );
      return multipleChoiceModel;
    } else {
      Get.snackbar(
        'Error',
        'Something Went Wrong',
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.all(15),
        backgroundColor: AppColor.redColor,
        colorText: AppColor.whiteColor,
      );
      return multipleChoiceModel;
    }
  }
}
