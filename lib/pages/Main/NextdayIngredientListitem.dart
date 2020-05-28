import 'package:flutter/material.dart';

class NextdayIngredientListitem extends StatelessWidget {
  final String _text;
  final bool _checked;

  NextdayIngredientListitem(this._text, this._checked);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Image.asset(
              _checked ? 'assets/images/checkBold.png' :'assets/images/crossBold.png',
              height: 20,
            ),
          ),
          RichText(
            text: TextSpan(
              text: '$_text',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
