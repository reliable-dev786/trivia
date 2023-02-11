import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quiz_app/app/model/multiplechoice_model.dart';

import '../../services/api_services.dart';
import '../views/quiz.dart';

class SimpleModeController extends GetxController {
  TextEditingController numberOfQuestions = TextEditingController();
  MultipleChoiceModel multipleChoiceModel = MultipleChoiceModel();
  List<String> categoryList = [
    'General Knowledge',
    'Entertainment: Books',
    'Entertainment: Film',
    'Entertainment: Music',
    'Entertainment: Television',
    'Entertainment: Video Games',
    'Entertainment: Board Games',
    'Science & Nature',
    'Mythology',
    'Sports'
  ];
  String mode = '';
  String category = '';
  String difficulty = '';
  String type = '';
  List<String> difficultyList = ['Easy', 'Medium', 'Hard'];
  List<String> selectTypeList = ['Multiple Choice', 'True / False'];
  RxInt currentQuestion = 0.obs;
  RxList<int> multipleChoiceAnswers = <int>[].obs;
  int life = 3;
  Timer? timer;
  RxInt start = 5.obs;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start.value == 0) {
          timer.cancel();
          start.value=5;
          if(life>=0) {
            if(currentQuestion.value<multipleChoiceModel.results!.length-1) {
              currentQuestion.value++;
            }
            if(multipleChoiceAnswers.isEmpty){
              multipleChoiceAnswers.add(-1);
            }else{
            }
            startTimer();
          }
        } else {
          start.value--;
        }
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
  }

  calculateScore() {
    int correctAnswers = 0;
    for (int i = 0; i < multipleChoiceModel.results!.length; i++) {
      if (multipleChoiceModel.results![i].incorrectAnswers!
              .elementAt(multipleChoiceAnswers[i]) ==
          multipleChoiceModel.results![i].correctAnswer) {
        correctAnswers++;
      }
    }

    return correctAnswers * checkEachQuestionScore(difficulty);
  }

  checkEachQuestionScore(String difficulty) {
    switch (difficulty) {
      case 'Easy':
        return 1;
      case 'Medium':
        return 2;
      case 'Hard':
        return 3;
    }
  }

  bool changeSelectedColor(index) {
    if (multipleChoiceAnswers.length - 1 >= currentQuestion.value) {
      if (multipleChoiceAnswers[currentQuestion.value] == index) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  getQuestion() async {
    multipleChoiceModel = await ApiServices.getMultipleChoice(
      amount: int.parse(numberOfQuestions.text),
      category: categoryList.indexOf(category) + 9,
      difficulty: difficulty.toLowerCase(),
      type:
          type == 'True / False' ? 'boolean' : type.split(' ')[0].toLowerCase(),
    );
    if (multipleChoiceModel.results != null) {
      if (multipleChoiceModel.results!.isNotEmpty) {
        Get.to(() => QuizView());
      }
    }
  }

  getQuestionQuick() async {
    List category = categoryList;
    category.shuffle();
    List difficult = difficultyList;
    difficult.shuffle();
    List typ = selectTypeList;
    typ.shuffle();

    multipleChoiceModel = await ApiServices.getMultipleChoice(
      amount: 20,
      category: categoryList.indexOf(category[0]) + 9,
      difficulty: difficult[0].toLowerCase(),
      type: typ[0] == 'True / False'
          ? 'boolean'
          : type.split(' ')[0].toLowerCase(),
    );
    if (multipleChoiceModel.results != null) {
      startTimer();
      if (multipleChoiceModel.results!.isNotEmpty) {
        Get.to(() => QuizView());
      }
    }
  }

  getString(int index) {
    switch (index) {
      case 0:
        return 'A';
      case 1:
        return 'B';
      case 2:
        return 'C';
      case 3:
        return 'D';
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
