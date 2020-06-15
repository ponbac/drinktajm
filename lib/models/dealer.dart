import 'dart:math';

import 'normal_question.dart';
import 'question.dart';

class Dealer {
  static final _rng = new Random();

  // Relative probability values for each category
  static const Map<String, int> _categoryProbabilities = {
    'KLUNKAR': 2,
    'PEKLEKEN': 2,
    'DUELL': 2,
    'TRIVIA': 2,
    'KATEGORI': 2,
    'REGEL': 1
  };

  //static const int NMBR_OF_CATEGORIES = 5;

  List<Question> _allQuestions;

  // decks to be used in game
  List<Question> _klunkarQuestions;
  List<Question> _peklekQuestions;
  List<Question> _duellQuestions;
  List<Question> _triviaQuestions;
  List<Question> _kategoriQuestions;
  List<Question> _regelQuestions;

  // lists that stores all questions for refilling game decks
  List<Question> _allKlunkarQuestions = new List<Question>();
  List<Question> _allPeklekQuestions = new List<Question>();
  List<Question> _allDuellQuestions = new List<Question>();
  List<Question> _allTriviaQuestions = new List<Question>();
  List<Question> _allKategoriQuestions = new List<Question>();
  List<Question> _allRegelQuestions = new List<Question>();

  Dealer(this._allQuestions) {
    //_testCategorySelector();

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
        case 'regel':
          _allRegelQuestions.add(question);
          break;
        default:
          print('(${question.description}) do not have a valid category!');
      }
    });

    _copyQuestionsToGameDecks();

    _shuffleAllDecks();
  }

  void _copyQuestionsToGameDecks() {
    print('Copying questions to game decks!');
    _klunkarQuestions = new List<Question>()..addAll(_allKlunkarQuestions);
    _peklekQuestions = new List<Question>()..addAll(_allPeklekQuestions);
    _duellQuestions = new List<Question>()..addAll(_allDuellQuestions);
    _triviaQuestions = new List<Question>()..addAll(_allTriviaQuestions);
    _kategoriQuestions = new List<Question>()..addAll(_allKategoriQuestions);
    _regelQuestions = new List<Question>()..addAll(_allRegelQuestions);
  }

  void _shuffleAllDecks() {
    _klunkarQuestions = _klunkarQuestions..shuffle();
    _peklekQuestions = _peklekQuestions..shuffle();
    _duellQuestions = _duellQuestions..shuffle();
    _triviaQuestions = _triviaQuestions..shuffle();
    _kategoriQuestions = _kategoriQuestions..shuffle();
    _regelQuestions = _regelQuestions..shuffle();
  }

  Question nextQuestion() {
    // TODO: Remake this!

    return _randomQuestion();
  }

  Question _randomQuestion() {
    String category = _categorySelector();

    switch (category.toLowerCase()) {
      case 'klunkar':
        // print('Klunkarkort kvar: ${_klunkarQuestions.length}\n${_klunkarQuestions.toString()}');
        // refill deck if empty
        if (_klunkarQuestions.length == 0) {
          _klunkarQuestions = new List<Question>()
            ..addAll(_allKlunkarQuestions);
          _klunkarQuestions = _klunkarQuestions..shuffle();
        }

        return _drawNextQuestion(_klunkarQuestions);
        break;
      case 'pekleken':
        if (_peklekQuestions.length == 0) {
          _peklekQuestions = new List<Question>()..addAll(_allPeklekQuestions);
          _peklekQuestions = _peklekQuestions..shuffle();
        }

        return _drawNextQuestion(_peklekQuestions);
        break;
      case 'duell':
        if (_duellQuestions.length == 0) {
          _duellQuestions = new List<Question>()..addAll(_allDuellQuestions);
          _duellQuestions = _duellQuestions..shuffle();
        }

        return _drawNextQuestion(_duellQuestions);
        break;
      case 'trivia':
        if (_triviaQuestions.length == 0) {
          _triviaQuestions = new List<Question>()..addAll(_allTriviaQuestions);
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
      case 'regel':
        if (_regelQuestions.length == 0) {
          _regelQuestions = new List<Question>()
            ..addAll(_allRegelQuestions);
          _regelQuestions = _regelQuestions..shuffle();
        }

        return _drawNextQuestion(_regelQuestions);
        break;
      default:
        print('$category is not a valid category!');
    }

    // No question available return
    return new NormalQuestion(
        'ERROR', 'No question could be found, mystiskt!', 0, false);
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

    int index = _rng.nextInt(totalSum) + 1;
    int sum = 0;
    int i = 0;
    while (sum < index) {
      sum = sum + _categoryProbabilities.values.toList()[i++];
    }

    return _categoryProbabilities.keys.toList()[max(0, i-1)];
  }

  void _testCategorySelector() {
    int counter1 = 0;
    int counter2 = 0;
    int counter3 = 0;
    int counter4 = 0;
    int counter5 = 0;
    int counter6 = 0;

    for (int i = 0; i < 1000; i++) {
      switch (_categorySelector().toLowerCase()) {
        case 'klunkar':
          counter1++;
          break;
        case 'pekleken':
          counter2++;
          break;
        case 'duell':
          counter3++;
          break;
        case 'trivia':
          counter4++;
          break;
        case 'kategori':
          counter5++;
          break;
        case 'regel':
          counter6++;
          break;
        default:
          print('Something is not a valid category!');
      }
    }

    print('counter1 = $counter1');
    print('counter2 = $counter2');
    print('counter3 = $counter3');
    print('counter4 = $counter4');
    print('counter5 = $counter5');
    print('counter6 = $counter6');
  }
}
