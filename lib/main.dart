import 'package:drinkinggame/pages/game_page.dart';
import 'package:drinkinggame/pages/start_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drinktajm',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StartPage(),
      routes: {
        GamePage.routeName: (ctx) => GamePage(),
      },
    );
  }
}