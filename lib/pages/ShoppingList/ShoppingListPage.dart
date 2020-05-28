import 'package:flutter/material.dart';
import 'package:cookio/pages/DraggableProduct.dart';

class ShoppingListPage extends StatefulWidget {
  final Map dragMap = {
    new DraggableProduct(): 0,
    new DraggableProduct(): 0,
    new DraggableProduct(): 0,
    new DraggableProduct(): 1,
    new DraggableProduct(): 1,
    new DraggableProduct(): 1,
  };

  ShoppingListPage();

  @override
  State<StatefulWidget> createState() {
    return _ShoppingListPage();
  }
}

class _ShoppingListPage extends State<ShoppingListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: RichText(
                    text: TextSpan(
                      text: 'Kühlschrank',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                  ),
                  margin: EdgeInsets.all(5),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(5),
                    width: double.infinity,
                    child: DragTarget(
                      builder: (BuildContext context,
                          List<DraggableProduct> incoming, List rejected) {
                        return Wrap(
                          children:
                          dragMaptoList(map: widget.dragMap, target: 0),
                        );
                      },
                      onWillAccept: (data) => true,
                      onAccept: (data) {
                        print(data);
                        setState(
                              () {
                            widget.dragMap.update(data, (value) => 0);
                          },
                        );
                      },
                      onLeave: (data) {},
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: RichText(
                    text: TextSpan(
                      text: 'Regal',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(5),
                    width: double.infinity,
                    child: DragTarget(
                      builder: (BuildContext context,
                          List<DraggableProduct> incoming, List rejected) {
                        return Wrap(
                          children:
                          dragMaptoList(map: widget.dragMap, target: 1),
                        );
                      },
                      onWillAccept: (data) => true,
                      onAccept: (data) {
                        //debugger();
                        setState(
                              () {
                            widget.dragMap.update(data, (value) => 1);
                          },
                        );
                      },
                      onLeave: (data) {},
                    ),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: dragMaptoList(map: widget.dragMap, target: 2).length > 0,
              child: DraggableScrollableSheet(
                minChildSize: 0.1,
                initialChildSize: 0.1,
                maxChildSize: 0.7,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Container(
                    margin: EdgeInsets.only(left: 5, right: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        )
                      ],
                    ),
                    child: Column(children: [
                      Container(
                        margin: EdgeInsets.only(left: 5, top: 5, right: 5),
                        child: RichText(
                          text: TextSpan(
                            text: 'Gerade eingekauft:',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      Flexible(
                        child: GridView.builder(
                          controller: scrollController,
                          itemCount:
                          dragMaptoList(map: widget.dragMap, target: 2)
                              .length,
                          itemBuilder: (BuildContext context, int index) {
                            return Center(
                                child: dragMaptoList(
                                    map: widget.dragMap, target: 2)
                                    .elementAt(index));
                          },
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 0,
                          ),
                          //children: [Center(child: Text('Aus dem letzten Einkauf'))]
                          //..addAll(dragMaptoList(map: widget.dragMap, target: 2)),
                        ),
                      ),
                    ]),
                  );
                },
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
