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

  Question getRandomQuestion() {
    currentQuestion = (_questionList..shuffle()).first;
    return currentQuestion;
  }

  set questionList(List<Question> list) {
    _questionList = list;
    getRandomQuestion();
  }
}
