import 'package:drinkinggame/widgets/header_text.dart';
import 'package:flutter/material.dart';

class PlayerSelect extends StatefulWidget {
  static const routeName = '/player_select';

  @override
  _PlayerSelectState createState() => _PlayerSelectState();
}

class _PlayerSelectState extends State<PlayerSelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          HeaderText('VÄLJ SPELARE'),
          Center(
              child: Ink(
            decoration: const ShapeDecoration(
              color: Colors.lightBlue,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: Icon(Icons.add),
              color: Colors.white,
              onPressed: () {},
            ),
          ))
        ],
      ),
    );
  }
}
