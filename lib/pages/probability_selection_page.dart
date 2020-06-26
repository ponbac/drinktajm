import 'package:drinkinggame/widgets/action_button.dart';
import 'package:drinkinggame/widgets/category_probability_input_field.dart';
import 'package:drinkinggame/widgets/header_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ProbabilitySelection extends StatelessWidget {
  final TextEditingController _textControllerKlunkar = TextEditingController();
  final TextEditingController _textControllerPekleken = TextEditingController();
  final TextEditingController _textControllerDuell = TextEditingController();
  final TextEditingController _textControllerTrivia = TextEditingController();
  final TextEditingController _textControllerKategori = TextEditingController();
  final TextEditingController _textControllerRegel = TextEditingController();

  int _cleanControllerText(TextEditingController controller) {
    if (controller.text == '') {
      return 0;
    } else {
      return int.parse(controller.text);
    }
  }

  bool _allFieldsEmpty() {
    int totalSum = _cleanControllerText(_textControllerKlunkar) +
        _cleanControllerText(_textControllerPekleken) +
        _cleanControllerText(_textControllerDuell) +
        _cleanControllerText(_textControllerTrivia) +
        _cleanControllerText(_textControllerKategori) +
        _cleanControllerText(_textControllerRegel);

    return totalSum == 0 ? true : false;
  }

  Map<String, int> _createProbabilityMap({bool empty = false}) {
    if (empty) {
      return {
        'KLUNKAR': 4,
        'PEKLEKEN': 4,
        'DUELL': 3,
        'TRIVIA': 3,
        'KATEGORI': 4,
        'REGEL': 2
      };
    }

    return {
      'KLUNKAR': _cleanControllerText(_textControllerKlunkar),
      'PEKLEKEN': _cleanControllerText(_textControllerPekleken),
      'DUELL': _cleanControllerText(_textControllerDuell),
      'TRIVIA': _cleanControllerText(_textControllerTrivia),
      'KATEGORI': _cleanControllerText(_textControllerKategori),
      'REGEL': _cleanControllerText(_textControllerRegel)
    };
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          HeaderText(
            'SANNOLIKHETER',
            size: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Relativ sannolikhet mellan de olika kategorierna.\nOm Klunkar = 1 och Pekleken = 2, så kommer dubbelt så många peklekenfrågor som klunkarfrågor dyka upp under spelets gång.',
              style: TextStyle(fontSize: 18, color: Colors.amber),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                CategoryProbabilityInputField(
                    'Klunkar', Icons.local_drink, _textControllerKlunkar),
                CategoryProbabilityInputField(
                    'Pekleken', Icons.accessibility, _textControllerPekleken),
                CategoryProbabilityInputField(
                    'Duell', Icons.alarm, _textControllerDuell),
                CategoryProbabilityInputField(
                    'Trivia', Icons.camera_roll, _textControllerTrivia),
                CategoryProbabilityInputField(
                    'Kategori', Icons.archive, _textControllerKategori),
                CategoryProbabilityInputField(
                    'Regel', Icons.star, _textControllerRegel),
              ],
            ),
          ),
          Container(
            height: height * 0.06,
            margin: EdgeInsets.only(top: 15),
            child: ActionButton(
              buttonTitle: 'Spara och starta!',
              onPress: () {
                if (!_allFieldsEmpty()) {
                  Navigator.pop(context, _createProbabilityMap());
                } else {
                  Navigator.pop(context, _createProbabilityMap(empty: true));
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
