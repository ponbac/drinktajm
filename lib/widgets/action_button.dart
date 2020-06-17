import 'package:flutter/material.dart';
import 'package:drinkinggame/constants.dart';

class ActionButton extends StatelessWidget {
  ActionButton({this.buttonTitle, this.onPress});

  final Function onPress;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 3.0,
      color: kPrimaryColor,
      highlightColor: kPrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onPressed: onPress,
      child: Text(
        buttonTitle,
        style: TextStyle(
          fontSize: 25,
          color: kBackgroundColor,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}