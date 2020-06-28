import 'package:drinkinggame/widgets/header_text.dart';
import 'package:flutter/material.dart';

class OneVsOne extends StatelessWidget {
  static const routeName = '/one_vs_one';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[500],
                        offset: Offset(8.0, 8.0),
                        blurRadius: 15.0,
                        spreadRadius: 1.0),
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(-8.0, -8.0),
                        blurRadius: 15.0,
                        spreadRadius: 1.0)
                  ]),
              child: Center(
                  child: Icon(
                Icons.local_drink,
                size: 80,
                color: Colors.black87,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
