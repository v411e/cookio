import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return LongPressDraggable(
      hapticFeedbackOnStart: true,
      data: this.widget,
      child: Container(
        margin: EdgeInsets.all(5),
        color: Colors.lightGreen,
        height: 50,
        width: 50,
      ),
      feedback: Container(
        color: Colors.green,
        height: 70,
        width: 70,
      ),
      childWhenDragging: Container(
        height: 50,
        width: 50,
      ),
    );
  }
}