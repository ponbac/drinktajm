import 'package:drinkinggame/models/normal_question.dart';
import 'package:drinkinggame/models/question.dart';
import 'package:drinkinggame/models/trivia_question.dart';
import 'package:flutter/material.dart';

import 'header_text.dart';

class QuestionCard extends StatelessWidget {
  final Question question;

  QuestionCard(this.question);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: question is NormalQuestion
          ? _buildNormalQuestion()
          : _buildTriviaQuestion(),
    );
  }

  Widget _buildNormalQuestion() {
    return Column(
      children: <Widget>[
        HeaderText('${question.category}'),
        Text(
          '${question.description}',
          style: TextStyle(fontSize: 26),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  Widget _buildTriviaQuestion() {
    TriviaQuestion triviaQuestion = question as TriviaQuestion;

    return Column(
      children: <Widget>[
        HeaderText(
            '${question.category}, ${triviaQuestion.difficulty}',
            size: 40),
        Text(
          '${question.description}',
          style: TextStyle(fontSize: 26, color: Colors.amber),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
