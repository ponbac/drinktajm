import 'dart:convert';
import 'package:drinkinggame/models/question.dart';
import 'package:flutter/material.dart';

Future<List<Question>> getQuestions(BuildContext context) async {
  var questions;

  var json =
      await DefaultAssetBundle.of(context).loadString("assets/questions.json");

  questions = (jsonDecode(json)['questions'] as List)
      .map((questionJson) => Question.fromJson(questionJson))
      .toList();

  //debugPrint('Returning questions: ' + questions.toString());
  return questions;
}