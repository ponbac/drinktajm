import 'package:drinkinggame/models/player.dart';
import 'package:drinkinggame/models/question.dart';
import 'package:drinkinggame/resources/question_provider.dart';
import 'package:flutter/material.dart';

class Session {
  Question currentQuestion;
  List<Question> _questionList;
  List<Question> _usedQuestions = new List<Question>();
  List<Player> playerList;

  Session(this.playerList) {
    print('New session!');
  }

  void addPlayer(Player player) {
    playerList.add(player);
  }

  void removePlayer(Player player) {
    playerList.remove(player);
  }

  void clearPlayers() {
    playerList.clear();
  }

  void nextQuestion() {
    if (_questionList.length == 0) {
      _questionList = []..addAll(_usedQuestions)..shuffle();
      _usedQuestions.clear();
      print('Reset questions!');
    }

    Question originalQuestion = _questionList.first;

    Question parsedQuestion = _parseQuestion(originalQuestion);

    _questionList.remove(originalQuestion);
    _usedQuestions.add(originalQuestion);

    currentQuestion = parsedQuestion;
  }

  Question _parseQuestion(Question question) {
    String questionText = question.description;
    int sips = question.sips;
    bool guaranteed = question.guaranteed;

    if (questionText.contains('[everyone]')) {
      if (questionText.startsWith('[')) {
        questionText = questionText.replaceAll('[everyone]', 'Alla');
      } else {
        questionText = questionText.replaceAll('[everyone]', 'alla');
      }

      if (guaranteed) {
        playerList.forEach((player) {
          player.addSips(sips);
          print('${player.name} = ${player.sips} sips!');
        });
      }
    }

    question = new Question(question.category, questionText, sips, guaranteed);
    return question;
  }

  List<Question> get questionList => _questionList;

  set questionList(List<Question> list) {
    _questionList = list..shuffle();
    nextQuestion();
  }
}
