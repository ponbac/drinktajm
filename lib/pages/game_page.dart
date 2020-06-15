import 'package:drinkinggame/models/player.dart';
import 'package:drinkinggame/models/session.dart';
import 'package:drinkinggame/models/question.dart';
import 'package:drinkinggame/pages/current_score_page.dart';
import 'package:drinkinggame/resources/question_provider.dart';
import 'package:drinkinggame/widgets/action_button.dart';
import 'package:drinkinggame/widgets/header_text.dart';
import 'package:drinkinggame/widgets/question_card.dart';

import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  static const routeName = '/game';

  final Session session;
  final Future loadQuestions = getQuestionsFromJson();

  GamePage(this.session);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  void _viewScore(BuildContext ctx, List<Player> playerList) {
    Navigator.of(ctx)
        .push(MaterialPageRoute(builder: (_) => CurrentScore(playerList)));
  }

  String _currentCategory = 'Not set!';

  @override
  Widget build(BuildContext context) {
    Session session = widget.session;

    return Scaffold(
      body: FutureBuilder<List<Question>>(
        future: widget.loadQuestions,
        builder:
            (BuildContext context, AsyncSnapshot<List<Question>> snapshot) {
          List<Widget> children;

          if (snapshot.hasData) {
            if (session.questionListLoaded == false) {
              session.questionList = snapshot.data;
            }

            Question currentQuestion = session.currentQuestion;
            _currentCategory = currentQuestion.category;
            //print('built widget');

            children = <Widget>[
              QuestionCard(currentQuestion, session),
              Container(
                height: 48,
                child: ActionButton(
                  buttonTitle: 'Nästa',
                  onPress: () {
                    setState(() {
                      session.nextQuestion();
                      session.displayingAnswer = false;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Ink(
                decoration: const ShapeDecoration(
                  color: Color(0xFF1089ff),
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: Icon(Icons.supervisor_account),
                  color: Colors.white,
                  onPressed: () => _viewScore(context, session.playerList),
                ),
              )),
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
                child: Text(
                  'Laddar frågor...',
                  style: TextStyle(fontSize: 26, color: Colors.amber),
                ),
              )
            ];
          }

          return Container(
            decoration: _categoryBackgroundColor(),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: children),
            ),
          );
        },
      ),
    );
  }

  BoxDecoration _categoryBackgroundColor() {
    if (_currentCategory == 'Regel') {
      return new BoxDecoration(color: Colors.red);
    }

    return new BoxDecoration(color: Color(0xFF421b9b));
  }
}
