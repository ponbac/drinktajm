import 'package:drinkinggame/models/dealer.dart';
import 'package:drinkinggame/models/player.dart';
import 'package:drinkinggame/models/question.dart';

import 'dart:math';

class Session {
  static final Random rng = new Random();

  Dealer dealer;

  Question currentQuestion;
  List<Question> _questionList;
  List<Question> _usedQuestions = new List<Question>();
  List<Player> playerList;

  Session(this.playerList) {
    print('New session!');
  }

  void nextQuestion() {
    if (_questionList.length == 0) {
      _questionList = []
        ..addAll(_usedQuestions)
        ..shuffle();
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

    if (questionText.contains('[sips]')) {
      questionText = questionText.replaceAll('[sips]', sips.toString());
    }

    if (questionText.contains('[player1]')) {
      int nmbrOfPlayers = playerList.length;
      List<Player> playerListCopy = []..addAll(playerList);

      Player randomPlayer1 = playerListCopy.elementAt(rng.nextInt(nmbrOfPlayers));
      playerListCopy.remove(randomPlayer1);
      questionText = questionText.replaceAll('[player1]', randomPlayer1.name);

      if (questionText.contains('[player2]') && nmbrOfPlayers >= 2) {
        Player randomPlayer2 = playerListCopy.elementAt(rng.nextInt(nmbrOfPlayers - 1));
        playerListCopy.remove(randomPlayer2);
        questionText = questionText.replaceAll('[player2]', randomPlayer2.name);
      }

      if (questionText.contains('[player3]') && nmbrOfPlayers >= 3) {
        Player randomPlayer3 = playerListCopy.elementAt(rng.nextInt(nmbrOfPlayers - 2));
        playerListCopy.remove(randomPlayer3);
        questionText = questionText.replaceAll('[player3]', randomPlayer3.name);
      }

      if (guaranteed) {
        randomPlayer1.addSips(sips);
      }
    }

    if (questionText.contains('[everyone]')) {
      if (questionText.startsWith('[')) {
        questionText = questionText.replaceAll('[everyone]', 'Alla');
      } else {
        questionText = questionText.replaceAll('[everyone]', 'alla');
      }

      if (guaranteed) {
        playerList.forEach((player) {
          player.addSips(sips);
          //print('${player.name} = ${player.sips} sips!');
        });
      }
    }

    question = new Question(question.category, questionText, sips, guaranteed);
    return question;
  }

  List<Question> get questionList => _questionList;

  set questionList(List<Question> list) {
    //_questionList = list..shuffle();
    _questionList = list;
    dealer = new Dealer(_questionList);

    nextQuestion();
    dealer.nextQuestion();
  }
}
