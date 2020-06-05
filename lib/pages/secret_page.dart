import 'package:flutter/material.dart';

class SecretPage extends StatelessWidget {
  static const routeName = '/game';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/nuggets.png'),
                fit: BoxFit.cover)),
        constraints: BoxConstraints.expand(),
        child: Column(),
      ),
    );
  }
}
