import 'dart:collection';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
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
  static const _target1 = 0;
  static const _target2 = 1;

  Map dragMap = {
    new DraggableProduct(): _target1,
    new DraggableProduct(): _target1,
    new DraggableProduct(): _target1,
    new DraggableProduct(): _target2,
    new DraggableProduct(): _target2,
    new DraggableProduct(): _target2,
  };

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
            Text('Kühlschrank:'),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                color: Colors.grey,
                child: DragTarget(
                  builder: (BuildContext context,
                      List<DraggableProduct> incoming, List rejected) {
                    return Wrap(
                      children: dragMaptoList(map: dragMap, target: _target1),
                    );
                  },
                  onWillAccept: (data) => true,
                  onAccept: (data) {
                    print(data);
                    setState(
                      () {
                        dragMap.update(data, (value) => _target1);
                      },
                    );
                  },
                  onLeave: (data) {},
                ),
              ),
            ),
            Text('Regal:'),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                color: Colors.grey,
                child: DragTarget(
                  builder: (BuildContext context,
                      List<DraggableProduct> incoming, List rejected) {
                    return Wrap(
                      children: dragMaptoList(map: dragMap, target: _target2),
                    );
                  },
                  onWillAccept: (data) => true,
                  onAccept: (data) {
                    //debugger();
                    setState(
                      () {
                        dragMap.update(data, (value) => _target2);
                      },
                    );
                  },
                  onLeave: (data) {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> dragMaptoList({Map map, int target}) {
    List<DraggableProduct> list = [];
    map.forEach((key, value) {
      if (value == target) {
        list.add(key);
      }
    });
    return list;
  }
}

class DraggableProduct extends StatefulWidget {
  DraggableProduct();

  @override
  State<StatefulWidget> createState() {
    return _DraggableProduct();
  }
}

class _DraggableProduct extends State<DraggableProduct> {
  @override
  Widget build(BuildContext context) {
    print('build ' + this.widget.hashCode.toString());
    //debugger();
    return Draggable(
      data: this.widget,
      child: Container(
        color: Colors.lightGreen,
        height: 50,
        width: 50,
      ),
      feedback: Container(
        color: Colors.orange,
        height: 50,
        width: 50,
      ),
      childWhenDragging: Container(
        color: Colors.blue,
        height: 50,
        width: 50,
      ),
    );
  }
}
