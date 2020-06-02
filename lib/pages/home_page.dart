import 'package:drinkinggame/pages/game_page.dart';
import 'package:drinkinggame/pages/player_select_page.dart';
import 'package:drinkinggame/widgets/action_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  void startGame(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(PlayerSelect.routeName);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: <Widget>[
              Center(
                child: Container(
                  margin: EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 8.0),
                  child: Text(
                    'ÖLSPELET',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 58.0,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 3.0),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.012,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  child: Image.asset(
                    'assets/images/beer.png',
                    height: height * 0.5,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.049,
              ),
              Center(
                child: IntrinsicWidth(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
//                    width: 155,
                        height: 64,
                        child: ActionButton(
                          buttonTitle: 'Supdags!',
                          onPress: () => startGame(context),
                        ),
                      ),
                      SizedBox(
                        height: 18.0,
                      ),
                      Container(
//                    width: 155,
                        height: 64,
                        child: ActionButton(
                          buttonTitle: 'Inställningar',
                          onPress: () => print('Settings!'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
