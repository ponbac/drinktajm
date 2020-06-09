import 'package:drinkinggame/models/player.dart';
import 'package:drinkinggame/models/session.dart';
import 'package:drinkinggame/pages/game_page.dart';
import 'package:drinkinggame/widgets/action_button.dart';
import 'package:drinkinggame/widgets/header_text.dart';
import 'package:flutter/material.dart';

class PlayerSelect extends StatefulWidget {
  static const routeName = '/player_select';

  @override
  _PlayerSelectState createState() => _PlayerSelectState();
}

class _PlayerSelectState extends State<PlayerSelect> {
  final _formKey = GlobalKey<FormState>();

  List<Player> playerList = new List<Player>();

  void _addPlayer(String name) {
    playerList.add(new Player(name));
  }

  void _startGame(BuildContext ctx) {
    if (playerList.length > 1) {
      Navigator.of(ctx).push(
          MaterialPageRoute(builder: (_) => GamePage(new Session(playerList))));
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 25,
          ),
          HeaderText('VÄLJ SPELARE'),
          Visibility(
              visible: playerList.length < 2,
              child: Text(
                'Minst två spelare!',
                style: TextStyle(fontSize: 18, color: Colors.amber),
              )),
          SizedBox(
            height: height * 0.60,
            child: ListView.builder(
                itemCount: playerList.length,
                itemBuilder: (context, index) {
                  return Center(
                      child: Text(
                    '${playerList.elementAt(index).name}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ));
                }),
          ),
          Center(
              child: Ink(
            decoration: const ShapeDecoration(
              color: Color(0xFF1089ff),
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: Icon(Icons.add),
              color: Colors.white,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return _buildDialog();
                    });
              },
            ),
          )),
          Container(
            height: height * 0.06,
            margin: EdgeInsets.only(top: 15),
            child: ActionButton(
              buttonTitle: 'Börja spela!',
              onPress: () => _startGame(context),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDialog() {
    return AlertDialog(
      content: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            right: -40.0,
            top: -40.0,
            child: InkResponse(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: CircleAvatar(
                child: Icon(Icons.close),
                backgroundColor: Colors.red,
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    onSaved: (String value) {
                      setState(() {
                        _addPlayer(value);
                        Navigator.of(context).pop();
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    child: Text("ska supa!"),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
