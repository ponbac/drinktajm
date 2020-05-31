import 'package:drinkinggame/models/question.dart';
import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {
  static const routeName = '/game';

  final Question currentQuestion = new Question("Alla dricker 4 klunkar!");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gametajm'),),
      body: Text(currentQuestion.description),
    );
  }
}
