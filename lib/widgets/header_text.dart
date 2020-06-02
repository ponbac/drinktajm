import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String text;

  HeaderText(this.text);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 8.0),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontSize: 58.0,
              fontWeight: FontWeight.w300,
              letterSpacing: 3.0),
        ),
      ),
    );
  }
}
