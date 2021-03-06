import 'package:cookio/pages/DraggableProduct.dart';
import 'package:flutter/material.dart';
import 'package:cookio/pages/Main/MainPage.dart';
import 'package:cookio/pages/Shelf/ShelfPage.dart';
import 'package:cookio/pages/ShoppingList/ShoppingListPage.dart';
import 'package:search_widget/search_widget.dart';

void main() {
  runApp(Cookio());
}

class Cookio extends StatelessWidget {
  // This widget is the root of your application.

  static final Map dragMap = {
    new DraggableProduct(): 0,
    new DraggableProduct(): 0,
    new DraggableProduct(): 0,
    new DraggableProduct(): 1,
    new DraggableProduct(): 1,
    new DraggableProduct(): 1,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
    new DraggableProduct(): 2,
  };

  static final controller = PageController(
    initialPage: 1,
  );

  final pageView = PageView(
    controller: controller,
    scrollDirection: Axis.horizontal,
    children: <Widget>[
      ShelfPage(dragMap),
      MainPage(),
      ShoppingListPage(dragMap),
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
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              SearchWidget(
                dataList: [1, 2, 3],
                popupListItemBuilder: null, //TODO: Implement
                selectedItemBuilder: null, //TODO: Implement
                queryBuilder: null, //TODO: Implement
              ),
              Expanded(child: pageView),
            ],
          ),
        ),
      ),
    );
  }
}
