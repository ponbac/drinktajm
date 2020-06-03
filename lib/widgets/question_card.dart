import 'package:drinkinggame/models/question.dart';
import 'package:flutter/material.dart';

import 'header_text.dart';

class QuestionCard extends StatelessWidget {
  final Question question;

  QuestionCard(this.question);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Column(
        children: <Widget>[
          HeaderText('${question.category}'),
          Text('${question.description}', style: TextStyle(fontSize: 22),  textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}
