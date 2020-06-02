import 'package:drinkinggame/models/player.dart';
import 'package:drinkinggame/models/question.dart';
import 'package:drinkinggame/resources/question_provider.dart';
import 'package:flutter/material.dart';

class Session {
  Question currentQuestion;
  List<Question> _questionList;
  List<Player> playerList;
  BuildContext context;

  Session(this.playerList, this.context);

  void addPlayer(Player player) {
    playerList.add(player);
  }

  void removePlayer(Player player) {
    playerList.remove(player);
  }

  void clearPlayers() {
    playerList.clear();
  }

  Question nextQuestion() {
    if (currentQuestion == null) {
      return _getRandomQuestion();
    }

    Question tmpQuestion = _getRandomQuestion();
    print(tmpQuestion.description);

    while (currentQuestion.description == tmpQuestion.description) {
      tmpQuestion = _getRandomQuestion();
    }

    currentQuestion = tmpQuestion;
    print(tmpQuestion.description);

    return currentQuestion;
  }

  Question _getRandomQuestion() {
    return (_questionList..shuffle()).first;
  }

  set questionList(List<Question> list) {
    _questionList = list;
    currentQuestion = nextQuestion();
  }
}
