import 'package:drinkinggame/models/trivia_question.dart';
import 'package:drinkinggame/widgets/action_button.dart';
import 'package:drinkinggame/models/normal_question.dart';
import 'package:drinkinggame/models/question.dart';
import 'package:drinkinggame/models/trivia_question.dart';
import 'package:flutter/material.dart';

import 'action_button.dart';
import 'header_text.dart';

class QuestionCard extends StatefulWidget {
  final Question question;

  QuestionCard(this.question);

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  bool _displayingAnswer = false;

  void _showAnswer(TriviaQuestion triviaQuestion) {
        print('The answer is: ${triviaQuestion.correctAnswer}');
        setState(() {
          _displayingAnswer = !_displayingAnswer;
        });
        _displayingAnswer = !_displayingAnswer;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(25),
      child: widget.question is NormalQuestion
          ? _buildNormalQuestion()
          : _buildTriviaQuestion(height, width),
    );
  }

  Widget _buildNormalQuestion() {
    return Column(
      children: <Widget>[
        HeaderText('${widget.question.category}'),
        Text(
          '${widget.question.description}',
          style: TextStyle(fontSize: 26),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  Widget _buildTriviaQuestion(double height, double width) {
    TriviaQuestion triviaQuestion = widget.question as TriviaQuestion;
    List<String> allAnswers = triviaQuestion.getAllAnswers();
    String correctAnswer = 'Loading...';

    return Container(
      height: height * 0.7,
      width: width * 0.9,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HeaderText(
                '${triviaQuestion.getDifficultyAsString()} ${widget.question.category.toLowerCase()}',
                size: 40),
            Text(
              '${triviaQuestion.triviaCategory}',
              style: TextStyle(fontSize: 26, color: Colors.deepOrangeAccent),
              textAlign: TextAlign.center,
            ),
            Text(
              '${widget.question.description}',
              style: TextStyle(fontSize: 26, color: Colors.amber),
              textAlign: TextAlign.center,
            ),
            Visibility(
              visible: !_displayingAnswer,
              child: Column(
                children: <Widget>[
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: allAnswers.length,
                      itemBuilder: (context, index) {
                        if (allAnswers[index] == triviaQuestion.correctAnswer) {
                          correctAnswer = '${index + 1}. ' + triviaQuestion.correctAnswer;
                        }

                        return Text(
                          '${index + 1}. ${allAnswers[index]}',
                          style: TextStyle(fontSize: 26, color: Colors.amber),
                          textAlign: TextAlign.center,
                        );
                      }),
                  ActionButton(
                    buttonTitle: 'Visa svar',
                    onPress: () => _showAnswer(triviaQuestion),
                  )
                ],
              ),
            ), Visibility(
              visible: _displayingAnswer,
              child: Text(
                '$correctAnswer',
                style: TextStyle(fontSize: 26, color: Colors.amber),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
