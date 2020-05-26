import 'package:flutter/material.dart';
import 'package:cookio/pages/Main/MainPage.dart';
import 'package:cookio/pages/Shelf/ShelfPage.dart';
import 'package:cookio/pages/ShoppingList/ShoppingListPage.dart';

void main() {
  runApp(Cookio());
}

class Cookio extends StatelessWidget {
  // This widget is the root of your application.

  static final controller = PageController(
    initialPage: 1,
  );

  final pageView = PageView(
    controller: controller,
    scrollDirection: Axis.horizontal,
    children: <Widget>[
      ShelfPage(),
      MainPage(),
      ShoppingListPage(),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cookio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: pageView,
    );
  }
}
