import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String text;
  final double size;

  HeaderText(this.text, {this.size=58});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 8.0),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontSize: size,
              fontWeight: FontWeight.w300,
              letterSpacing: 3.0),
        ),
      ),
    );
  }
}
