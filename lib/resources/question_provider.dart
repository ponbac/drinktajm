import 'dart:convert';
import 'package:drinkinggame/models/question.dart';
import 'package:drinkinggame/models/trivia_question.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Gets questions from opentdb for trivia and self written from github json
Future<List<Question>> getQuestionsFromJson() async {
  final String url = 'https://ponbac.github.io/json.html';
  final String triviaUrl = 'https://opentdb.com/api.php?amount=50&type=multiple';

  var raw = await http.get(url);
  var triviaRaw = await http.get(triviaUrl);
  //await DefaultAssetBundle.of(context).loadString("assets/questions.json");


  var questions = (jsonDecode(raw.body)['questions'] as List)
      .map((questionJson) => Question.fromJson(questionJson))
      .toList();

  var triviaQuestions = (jsonDecode(triviaRaw.body)['results'] as List)
      .map((questionJson) => TriviaQuestion.fromJson(questionJson))
      .toList();

  //debugPrint('Returning questions: ' + questions.toString());
  return new List<Question>.from(questions)..addAll(triviaQuestions);
}