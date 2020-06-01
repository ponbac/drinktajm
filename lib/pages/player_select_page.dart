import 'package:flutter/material.dart';

class PlayerSelect extends StatelessWidget {
  static const routeName = '/player_select';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Välj spelare'),
      ),
      body: ListView(),
    );
  }
}
