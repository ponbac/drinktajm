import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  ActionButton({this.buttonTitle, this.onPress});

  final Function onPress;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 3.0,
      color: Color(0xFF1089ff),
      highlightColor: Color(0xFF1089ff),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onPressed: onPress,
      child: Text(
        buttonTitle,
        style: TextStyle(
          fontSize: 25,
          color: Colors.white,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}