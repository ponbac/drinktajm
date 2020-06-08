import 'dart:collection';
import 'dart:math';

import 'question.dart';

class Dealer {
  static final _rng = new Random();

  // Relative probability values for each category
  static const Map<String, int> _categoryProbabilities = {
    'KLUNKAR': 1,
    'PEKLEKEN': 1,
    'DUELL': 1,
    'TRIVIA': 1,
    'KATEGORI': 1
  };

  //static const int NMBR_OF_CATEGORIES = 5;

  List<Question> _allQuestionsList;

  List<Question> _klunkarQuestionsList = new List<Question>();
  List<Question> _peklekQuestionsList = new List<Question>();
  List<Question> _duellQuestionsList = new List<Question>();
  List<Question> _triviaQuestionsList = new List<Question>();
  List<Question> _kategoriQuestionsList = new List<Question>();

  List<Question> _usedKlunkarQuestionsList = new List<Question>();
  List<Question> _usedPeklekQuestionsList = new List<Question>();
  List<Question> _usedDuellQuestionsList = new List<Question>();
  List<Question> _usedTriviaQuestionsList = new List<Question>();
  List<Question> _usedKategoriQuestionsList = new List<Question>();

  Dealer(this._allQuestionsList) {
    // fill decks
    _allQuestionsList.forEach((question) {
      switch (question.category.toLowerCase()) {
        case 'klunkar':
          _klunkarQuestionsList.add(question);
          break;
        case 'pekleken':
          _peklekQuestionsList.add(question);
          break;
        case 'duell':
          _duellQuestionsList.add(question);
          break;
        case 'trivia':
          _triviaQuestionsList.add(question);
          break;
        case 'kategori':
          _kategoriQuestionsList.add(question);
          break;
        default:
          print('(${question.description}) do not have a valid category!');
      }
    });

    // shuffle all decks
    _klunkarQuestionsList = _klunkarQuestionsList..shuffle();
    _peklekQuestionsList = _peklekQuestionsList..shuffle();
    _duellQuestionsList = _duellQuestionsList..shuffle();
    _triviaQuestionsList = _triviaQuestionsList..shuffle();
    _kategoriQuestionsList = _kategoriQuestionsList..shuffle();
  }

  Question nextQuestion() {
    /*if (_questionList.length == 0) {
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

    return parsedQuestion;*/

    _randomQuestion();
  }

  Question _randomQuestion() {
    String category = _categorySelector();

    switch (category.toLowerCase()) {
      case 'klunkar':

        break;
      case 'pekleken':

        break;
      case 'duell':

        break;
      case 'trivia':

        break;
      case 'kategori':

        break;
      default:
        print('$category is not a valid category!');
    }
  }

  String _categorySelector() {
    int totalSum = 0;

    _categoryProbabilities.forEach((key, value) {
      totalSum += value;
    });

    int index = _rng.nextInt(totalSum);
    int sum = 0;
    int i = 0;
    while (sum < index) {
      sum = sum + _categoryProbabilities.values.toList()[i++];
    }

    return _categoryProbabilities.keys.toList()[max(0, i)];
  }
}
