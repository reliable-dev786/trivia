import 'dart:convert';

MultipleChoiceModel answerFromJson(String str) => MultipleChoiceModel.fromJson(json.decode(str));

class MultipleChoiceModel {
  MultipleChoiceModel({
    this.responseCode,
    this.results,
  });

  final int? responseCode;
  final List<Result>? results;

  factory MultipleChoiceModel.fromJson(Map<String, dynamic> json) => MultipleChoiceModel(
        responseCode: json["response_code"],
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
      );
}

class Result {
  Result({
    this.category,
    this.type,
    this.difficulty,
    this.question,
    this.correctAnswer,
    this.incorrectAnswers,
  });

  final String? category;
  final String? type;
  final String? difficulty;
  final String? question;
  final String? correctAnswer;
  final List<String>? incorrectAnswers;

  factory Result.fromJson(Map<String, dynamic> json) {
    List<String> inAnswer=List<String>.from(json["incorrect_answers"].map((x) => x));
    inAnswer.add(json["correct_answer"]);
    inAnswer.shuffle();
      return Result(
      category: json["category"],
      type: json["type"],
      difficulty: json["difficulty"],
      question: json["question"],
      correctAnswer: json["correct_answer"],
      incorrectAnswers: json["incorrect_answers"] == null
          ? []
          : List<String>.from(inAnswer.map((x) => x)),
    );
  }
}
