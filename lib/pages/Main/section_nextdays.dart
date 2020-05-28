import 'package:flutter/material.dart';
import 'NextdayIngredientListitem.dart';

class NextDaysSection extends StatelessWidget {
  final String _day;
  final String _title;
  final int _cookingTime;
  final int _persons;
  final List<String> _ingredients;

  NextDaysSection(this._day, this._title, this._cookingTime, this._persons,
      this._ingredients);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RichText(
              text: TextSpan(
                text: '$_day: ',
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: RichText(
                text: TextSpan(
                  text: '$_title',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Icon(Icons.schedule, size: 20),
                            ),
                            Text('$_cookingTime min'),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Icon(Icons.people, size: 20),
                            ),
                            Text('$_persons'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      NextdayIngredientListitem('Tomaten', false),
                      NextdayIngredientListitem('Nudeln', true),
                      NextdayIngredientListitem('Parmesan', false),
                      NextdayIngredientListitem('Gute Laune', true),
                      NextdayIngredientListitem('Prise Salz', true),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
