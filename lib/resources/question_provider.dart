import 'dart:convert';
import 'package:drinkinggame/models/question.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Question>> getQuestions() async {
  final String url = 'https://ponbac.github.io/json.html';

  var raw = await http.get(url);
  //await DefaultAssetBundle.of(context).loadString("assets/questions.json");


  var questions = (jsonDecode(raw.body)['questions'] as List)
      .map((questionJson) => Question.fromJson(questionJson))
      .toList();

  //debugPrint('Returning questions: ' + questions.toString());
  return questions;
}