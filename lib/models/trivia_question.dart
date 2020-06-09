import 'package:drinkinggame/models/question.dart';

enum Difficulty { easy, medium, hard }

class TriviaQuestion extends Question {
  final String triviaCategory;
  final Difficulty difficulty;
  final String correctAnswer;
  final List<String> answers;

  TriviaQuestion(String category, String description, int sips, bool guaranteed,
      this.triviaCategory, this.difficulty, this.correctAnswer, this.answers)
      : super(category, description, sips, guaranteed);

  factory TriviaQuestion.fromJson(dynamic json) {
    Difficulty diff;
    int sipsBasedOnDiff = 0;

    switch (json['difficulty'] as String) {
      case 'easy':
        diff = Difficulty.easy;
        sipsBasedOnDiff = 5;
        break;
      case 'medium':
        diff = Difficulty.medium;
        sipsBasedOnDiff = 10;
        break;
      case 'hard':
        diff = Difficulty.hard;
        sipsBasedOnDiff = 15;
        break;
    }

    return TriviaQuestion(
        'Trivia',
        '[player1]:\n' + json['question'] + '\nDela ut [sips] klunkar vid korrekt svar.',
        sipsBasedOnDiff,
        false,
        json['category'] as String,
        diff,
        json['correct_answer'] as String,
        json['incorrect_answers'].cast<String>());
  }
}
