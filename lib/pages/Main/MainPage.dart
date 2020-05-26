import 'package:flutter/material.dart';
import 'package:search_widget/search_widget.dart';
import 'package:cookio/pages/Main/section_nextdays.dart';


class MainPage extends StatefulWidget {
  final String title;

  MainPage({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MainPage();
  }
}

class _MainPage extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                SearchWidget(
                  dataList: [1, 2, 3],
                  popupListItemBuilder: null, //TODO: Implement
                  selectedItemBuilder: null, //TODO: Implement
                  queryBuilder: null, //TODO: Implement
                ),
                NextDaysSection(
                  'Today',
                  'Nudeln mit Tomatensauce',
                  10,
                  2,
                  ['Nudeln', 'Tomaten', 'Knoblauch'],
                ),
                NextDaysSection(
                  'Tomorrow',
                  'Nudeln mit Tomatensauce',
                  10,
                  2,
                  ['Nudeln', 'Tomaten', 'Knoblauch'],
                ),
                NextDaysSection(
                  'Monday',
                  'Nudeln mit Tomatensauce',
                  10,
                  2,
                  ['Nudeln', 'Tomaten', 'Knoblauch'],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
