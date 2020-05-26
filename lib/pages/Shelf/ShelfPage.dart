import 'package:flutter/material.dart';
import 'package:search_widget/search_widget.dart';


class ShelfPage extends StatefulWidget {
  ShelfPage();

  @override
  State<StatefulWidget> createState() {
    return _ShelfPage();
  }
}

class _ShelfPage extends State<ShelfPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SearchWidget(
              dataList: [1, 2, 3],
              popupListItemBuilder: null, //TODO: Implement
              selectedItemBuilder: null, //TODO: Implement
              queryBuilder: null, //TODO: Implement
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/shelf.png'),
                    fit: BoxFit.fitWidth),
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Image.asset(
                      'assets/images/milk.png',
                      height: 40.0,
                    ),
                    margin: EdgeInsets.only(
                        left: 10.0, right: 10.0, bottom: 30.0),
                  ),
                  Container(
                    child: Image.asset(
                      'assets/images/milk.png',
                      height: 40.0,
                    ),
                    margin: EdgeInsets.only(
                        left: 10.0, right: 10.0, bottom: 30.0),
                  ),
                  Container(
                    child: Image.asset(
                      'assets/images/milk.png',
                      height: 40.0,
                    ),
                    margin: EdgeInsets.only(
                        left: 10.0, right: 10.0, bottom: 30.0),
                  ),
                  Container(
                    child: Image.asset(
                      'assets/images/milk.png',
                      height: 40.0,
                    ),
                    margin: EdgeInsets.only(
                        left: 10.0, right: 10.0, bottom: 30.0),
                  ),
                  Container(
                    child: Image.asset(
                      'assets/images/milk.png',
                      height: 40.0,
                    ),
                    margin: EdgeInsets.only(
                        left: 10.0, right: 10.0, bottom: 30.0),
                  ),
                ],
              ),
              margin: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/shelf.png'),
                    fit: BoxFit.fitWidth),
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Image.asset(
                      'assets/images/milk.png',
                      height: 40.0,
                    ),
                    margin: EdgeInsets.only(
                        left: 10.0, right: 10.0, bottom: 30.0),
                  ),
                ],
              ),
              margin: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
            ),
            Container(
              child: Image.asset('assets/images/shelf.png'),
              margin: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
            ),
          ],
        ),
      ),
    );
  }
}
