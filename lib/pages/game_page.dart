import 'package:drinkinggame/models/player.dart';
import 'package:drinkinggame/models/session.dart';
import 'package:drinkinggame/models/question.dart';
import 'package:drinkinggame/resources/question_provider.dart';
import 'package:drinkinggame/widgets/action_button.dart';
import 'package:drinkinggame/widgets/header_text.dart';

import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  static const routeName = '/game';

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<Player> playerList;

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, List<Player>>;

    playerList = routeArgs['playerList'];

    Session session = new Session(playerList, context);

    return Scaffold(
      body: FutureBuilder<List<Question>>(
        future: getQuestions(context),
        builder:
            (BuildContext context, AsyncSnapshot<List<Question>> snapshot) {
          List<Widget> children;

          if (snapshot.hasData) {
            session.questionList = snapshot.data;

            Question currentQuestion = session.currentQuestion;

            children = <Widget>[
              Container(
                padding: EdgeInsets.all(25),
                child: Column(
                  children: <Widget>[
                    HeaderText('${currentQuestion.category}'),
                    Text('${currentQuestion.description}',
                        style: TextStyle(fontSize: 22))
                  ],
                ),
              ), Container(
                height: 48,
                child: ActionButton(buttonTitle: 'Nästa', onPress: () {
                  setState(() {
                    print('NEW QUESTION: ${session.currentQuestion}');
                  });
                },),
              )
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
