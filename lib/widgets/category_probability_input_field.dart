import 'package:flutter/material.dart';

import '../constants.dart';

class CategoryProbabilityInputField extends StatelessWidget {
  final String _hint;
  final IconData _icon;
  final TextEditingController _textController;

  CategoryProbabilityInputField(this._hint, this._icon, this._textController);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Icon(
            _icon,
            color: kPrimaryColor,
          ),
        ),
        Expanded(
          child: TextField(
            keyboardType: TextInputType.number,
            controller: _textController,
            decoration: InputDecoration(
              hintText: _hint,
            ),
          ),
        )
      ],
    );
  }
}
