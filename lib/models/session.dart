import 'package:drinkinggame/models/dealer.dart';
import 'package:drinkinggame/models/player.dart';
import 'package:drinkinggame/models/question.dart';

import 'dart:math';

import 'package:drinkinggame/models/trivia_question.dart';

import 'normal_question.dart';

class Session {
  static final Random rng = new Random();

  Dealer dealer;

  Question currentQuestion;
  bool questionListLoaded = false;
  bool displayingAnswer = false;
  List<Player> playerList;

  // TODO: Should not be here.
  Map<String, int> categoryProbabilities;

  Session(this.playerList, {this.categoryProbabilities}) {
    print('New session!');

    if (categoryProbabilities != null) {
      print('Custom category P!');
    }
  }

  void nextQuestion() {
    Question parsedQuestion = _parseQuestion(dealer.nextQuestion());

    currentQuestion = parsedQuestion;
  }

  // TODO: THIS METHOD NEEDS A LOT OF WORK, DIVIDE!
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

      Player randomPlayer1 =
          playerListCopy.elementAt(rng.nextInt(nmbrOfPlayers));
      playerListCopy.remove(randomPlayer1);
      questionText = questionText.replaceAll('[player1]', randomPlayer1.name);

      if (questionText.contains('[player2]') && nmbrOfPlayers >= 2) {
        Player randomPlayer2 =
            playerListCopy.elementAt(rng.nextInt(nmbrOfPlayers - 1));
        playerListCopy.remove(randomPlayer2);
        questionText = questionText.replaceAll('[player2]', randomPlayer2.name);
      }

      if (questionText.contains('[player3]') && nmbrOfPlayers >= 3) {
        Player randomPlayer3 =
            playerListCopy.elementAt(rng.nextInt(nmbrOfPlayers - 2));
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

    if (question is TriviaQuestion) {
      return new TriviaQuestion(
          question.category,
          questionText,
          sips,
          guaranteed,
          question.triviaCategory,
          question.difficulty,
          question.correctAnswer,
          question.answers);
    } else {
      question =
          new NormalQuestion(question.category, questionText, sips, guaranteed);
    }

    return question;
  }

  set questionList(List<Question> list) {
    if (categoryProbabilities != null) {
      dealer = new Dealer(list, categoryProbabilities: categoryProbabilities);
    } else {
      dealer = new Dealer(list);
    }

    questionListLoaded = true;

    nextQuestion();
  }
}
