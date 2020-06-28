import 'package:drinkinggame/pages/game_page.dart';
import 'package:drinkinggame/pages/one_vs_one_page.dart';
import 'package:drinkinggame/pages/player_select_page.dart';
import 'package:drinkinggame/pages/home_page.dart';
import 'package:drinkinggame/pages/secret_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:drinkinggame/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Drinktajm',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: TextTheme(
          headline4: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          button: TextStyle(color: kPrimaryColor),
          headline5:
          TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(.2),
            ),
          ),
        ),
      ),
      home: HomePage(),
      routes: {
        //GamePage.routeName: (ctx) => GamePage(Session s),
        PlayerSelect.routeName: (ctx) => PlayerSelect(),
        SecretPage.routeName: (ctx) => SecretPage(),
        OneVsOne.routeName: (ctx) => OneVsOne()
      },
    );
  }
}
