import 'dart:math';

import 'normal_question.dart';
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

  List<Question> _allQuestions;

  // decks to be used in game
  List<Question> _klunkarQuestions;
  List<Question> _peklekQuestions;
  List<Question> _duellQuestions;
  List<Question> _triviaQuestions;
  List<Question> _kategoriQuestions;

  // lists that stores all questions for refilling game decks
  List<Question> _allKlunkarQuestions = new List<Question>();
  List<Question> _allPeklekQuestions = new List<Question>();
  List<Question> _allDuellQuestions = new List<Question>();
  List<Question> _allTriviaQuestions = new List<Question>();
  List<Question> _allKategoriQuestions = new List<Question>();

  Dealer(this._allQuestions) {
    // fill decks
    _allQuestions.forEach((question) {
      switch (question.category.toLowerCase()) {
        case 'klunkar':
          _allKlunkarQuestions.add(question);
          break;
        case 'pekleken':
          _allPeklekQuestions.add(question);
          break;
        case 'duell':
          _allDuellQuestions.add(question);
          break;
        case 'trivia':
          _allTriviaQuestions.add(question);
          break;
        case 'kategori':
          _allKategoriQuestions.add(question);
          break;
        default:
          print('(${question.description}) do not have a valid category!');
      }
    });

    _copyQuestionsToGameDecks();

    _shuffleAllDecks();
  }

  void _copyQuestionsToGameDecks() {
    _klunkarQuestions = new List<Question>()..addAll(_allKlunkarQuestions);
    _peklekQuestions = new List<Question>()..addAll(_allPeklekQuestions);
    _duellQuestions = new List<Question>()..addAll(_allDuellQuestions);
    _triviaQuestions = new List<Question>()..addAll(_allTriviaQuestions);
    _kategoriQuestions = new List<Question>()..addAll(_allKategoriQuestions);
  }

  void _shuffleAllDecks() {
    _klunkarQuestions = _klunkarQuestions..shuffle();
    _peklekQuestions = _peklekQuestions..shuffle();
    _duellQuestions = _duellQuestions..shuffle();
    _triviaQuestions = _triviaQuestions..shuffle();
    _kategoriQuestions = _kategoriQuestions..shuffle();
  }

  Question nextQuestion() {
    // TODO: Remake this!

    return _randomQuestion();
  }

  Question _randomQuestion() {
    String category = _categorySelector();

    switch (category.toLowerCase()) {
      case 'klunkar':
        // refill deck if empty
        if (_klunkarQuestions.length == 0) {
          _klunkarQuestions = new List<Question>()
            ..addAll(_allKlunkarQuestions);
          _klunkarQuestions =_klunkarQuestions..shuffle();
        }

        return _drawNextQuestion(_klunkarQuestions);
        break;
      case 'pekleken':
        if (_peklekQuestions.length == 0) {
          _peklekQuestions = new List<Question>()
            ..addAll(_allPeklekQuestions);
          _peklekQuestions= _peklekQuestions..shuffle();
        }

        return _drawNextQuestion(_peklekQuestions);
        break;
      case 'duell':
        if (_duellQuestions.length == 0) {
          _duellQuestions = new List<Question>()
            ..addAll(_allDuellQuestions);
          _duellQuestions= _duellQuestions..shuffle();
        }

        return _drawNextQuestion(_duellQuestions);
        break;
      case 'trivia':
        if (_triviaQuestions.length == 0) {
          _triviaQuestions = new List<Question>()
            ..addAll(_allTriviaQuestions);
          _triviaQuestions = _triviaQuestions..shuffle();
        }

        return _drawNextQuestion(_triviaQuestions);
        break;
      case 'kategori':
        if (_kategoriQuestions.length == 0) {
          _kategoriQuestions = new List<Question>()
            ..addAll(_allKategoriQuestions);
          _kategoriQuestions = _kategoriQuestions..shuffle();
        }

        return _drawNextQuestion(_kategoriQuestions);
        break;
      default:
        print('$category is not a valid category!');
    }

    // No question available return
    return new NormalQuestion('ERROR', 'No question could be found, mystiskt!', 0, false);
  }

  Question _drawNextQuestion(List<Question> questionList) {
    Question question = questionList.first;

    questionList.remove(question);

    return question;
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
