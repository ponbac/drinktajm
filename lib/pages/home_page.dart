import 'package:drinkinggame/pages/game_page.dart';
import 'package:drinkinggame/pages/one_vs_one_page.dart';
import 'package:drinkinggame/pages/player_select_page.dart';
import 'package:drinkinggame/pages/secret_page.dart';
import 'package:drinkinggame/widgets/action_button.dart';
import 'package:drinkinggame/widgets/header_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  void _startGame(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(PlayerSelect.routeName);
  }

  void _openSecret(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(SecretPage.routeName);
  }

  void _open1v1(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(OneVsOne.routeName);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          HeaderText('FÄRJEVÄGEN 22'),
          SizedBox(
            height: height * 0.012,
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(5.0),
              child: Image.asset(
                'assets/images/beer.png',
                height: height * 0.45,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: IntrinsicWidth(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
//                    width: 155,
                      height: height * 0.07,
                      child: ActionButton(
                        buttonTitle: 'Supdags!',
                        onPress: () => _startGame(context),
                      ),
                    ),
                    Container(
//                    width: 155,
                      height: height * 0.07,
                      child: ActionButton(
                        buttonTitle: 'En mot en',
                        onPress: () => _open1v1(context),
                      ),
                    ),
                    Container(
//                    width: 155,
                      height: height * 0.07,
                      child: ActionButton(
                        buttonTitle: 'Hemligt',
                        onPress: () => _openSecret(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
