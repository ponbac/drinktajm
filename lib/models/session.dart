import 'package:drinkinggame/models/player.dart';
import 'package:drinkinggame/models/question.dart';
import 'package:drinkinggame/resources/question_provider.dart';
import 'package:flutter/material.dart';

class Session {
  Question currentQuestion;
  List<Question> _questionList;
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

  Question nextQuestion() {
    if (currentQuestion == null) {
      return _getRandomQuestion();
    }

    Question tmpQuestion = _getRandomQuestion();
    //print(tmpQuestion.description);

    while (currentQuestion.description == tmpQuestion.description) {
      tmpQuestion = _getRandomQuestion();
    }

    tmpQuestion = _parseQuestion(tmpQuestion);
    currentQuestion = tmpQuestion;
    //print(tmpQuestion.description);

    return currentQuestion;
  }

  Question _parseQuestion(Question question) {
    String questionText = question.description;
    int sips = question.sips;
    bool guaranteed = question.guaranteed;

    if (questionText.contains('[all]')) {
      if (questionText.startsWith('[')) {
        questionText = questionText.replaceAll('[all]', 'Alla');
      } else {
        questionText = questionText.replaceAll('[all]', 'alla');
      }

      if (guaranteed) {
        playerList.forEach((player) => player.addSips(sips));
      }
    }

    question.description = questionText;
    return question;
  }

  Question _getRandomQuestion() {
    return (_questionList..shuffle()).first;
  }


  List<Question> get questionList => _questionList;

  set questionList(List<Question> list) {
    _questionList = list;
    currentQuestion = nextQuestion();
  }
}
