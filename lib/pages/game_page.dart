import 'package:drinkinggame/models/player.dart';
import 'package:drinkinggame/models/session.dart';
import 'package:drinkinggame/models/question.dart';
import 'package:drinkinggame/resources/question_provider.dart';

import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {
  static const routeName = '/game';

  @override
  Widget build(BuildContext context) {
    Session session = new Session(new List<Player>(), context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Gametajm'),
      ),
      body: FutureBuilder<List<Question>>(
        future: getQuestions(context),
        builder:
            (BuildContext context, AsyncSnapshot<List<Question>> snapshot) {
          List<Widget> children;

          if (snapshot.hasData) {
            session.questionList = snapshot.data;

            Question currentQuestion = session.currentQuestion;

            children = <Widget>[
              Text('${currentQuestion.category}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
              Text(
                  '${currentQuestion.description}', style: TextStyle(fontSize: 20))
            ];
          } else {
            children = <Widget>[
              SizedBox(
                child: CircularProgressIndicator(),
                width: 60,
                height: 60,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Laddar frågor...'),
              )
            ];
          }

          return Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: children),
          );
        },
      ),
    );
  }
}
