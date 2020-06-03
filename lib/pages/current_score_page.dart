import 'package:drinkinggame/models/player.dart';
import 'package:drinkinggame/widgets/action_button.dart';
import 'package:drinkinggame/widgets/header_text.dart';
import 'package:flutter/material.dart';

class CurrentScore extends StatelessWidget {
  final List<Player> playerList;

  CurrentScore(this.playerList);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    
    playerList.sort((a, b) => b.sips.compareTo(a.sips));

    return Scaffold(
      body: Column(
        children: <Widget>[
          HeaderText('TOPPLISTAN'),
          SizedBox(
            height: height * 0.65,
            child: ListView.builder(
                itemCount: playerList.length,
                itemBuilder: (context, index) {
                  Player currentPlayer = playerList.elementAt(index);

                  return Center(
                      child: Text(
                        '${index + 1}. ${currentPlayer.name} ${currentPlayer.sips}🍺',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                      ));
                }),
          ),
          Container(
            height: height*0.06,
            margin: EdgeInsets.only(top: 15),
            child: ActionButton(
              buttonTitle: 'Tillbaka',
              onPress: () => Navigator.of(context).pop(),
            ),
          )
        ],
      ),
    );
  }
}
