import 'package:drinkinggame/models/session.dart';
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
  final Session session;

  QuestionCard(this.question, this.session);

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  //bool _displayingAnswer = false;
  String correctAnswer = 'Loading...';

  void _showAnswer(TriviaQuestion triviaQuestion) {
        print('The answer is: ${triviaQuestion.correctAnswer}');
        setState(() {
          widget.session.displayingAnswer = true;
        });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.7,
      width: width * 0.9,
      padding: EdgeInsets.all(25),
      child: widget.question is NormalQuestion
          ? _buildNormalQuestion()
          : _buildTriviaQuestion(),
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

  Widget _buildTriviaQuestion() {
    TriviaQuestion triviaQuestion = widget.question as TriviaQuestion;
    List<String> allAnswers = triviaQuestion.getAllAnswers();

    return Container(
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
              visible: !widget.session.displayingAnswer,
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
              visible: widget.session.displayingAnswer,
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
