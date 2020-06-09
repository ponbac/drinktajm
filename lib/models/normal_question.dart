import 'package:drinkinggame/models/question.dart';

class NormalQuestion extends Question {
  NormalQuestion(String category, String description, int sips, bool guaranteed) : super(category, description, sips, guaranteed);

  factory NormalQuestion.fromJson(dynamic json) {
    return NormalQuestion(json['category'] as String, json['description'] as String, json['sips'] as int, json['guaranteed'] as bool);
  }
}