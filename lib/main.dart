import 'package:drinkinggame/pages/game_page.dart';
import 'package:drinkinggame/pages/player_select_page.dart';
import 'package:drinkinggame/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Drinktajm',
      theme: ThemeData.dark().copyWith(
        tooltipTheme: TooltipThemeData(
          decoration: BoxDecoration(
            color: Color(0xFF1089ff),
            borderRadius: BorderRadius.circular(5.0),
          ),
          textStyle: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 20.0,
            letterSpacing: 1.0,
            color: Colors.white,
          ),
        ),
        scaffoldBackgroundColor: Color(0xFF421b9b),
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'PatrickHand'),
      ),
      //home: StartPage(),
      home: HomePage(),
      routes: {
        GamePage.routeName: (ctx) => GamePage(),
        PlayerSelect.routeName: (ctx) => PlayerSelect()
      },
    );
  }
}
