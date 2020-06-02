import 'package:drinkinggame/pages/game_page.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  void startGame(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(GamePage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: () => startGame(context),
              child: Text(
                "Start!",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
