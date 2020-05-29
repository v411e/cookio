import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    return _MediumLongPressDraggable(
      hapticFeedbackOnStart: true,
      data: this.widget,
      child: Container(
        margin: EdgeInsets.all(5),
        color: Colors.lightGreen,
        height: 50,
        width: 50,
      ),
      feedback: Container(
        decoration: BoxDecoration(
          color: Colors.green,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ],
        ),
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

class _MediumLongPressDraggable<T> extends LongPressDraggable<T> {
  const _MediumLongPressDraggable({
    Key key,
    @required Widget child,
    @required Widget feedback,
    T data,
    Axis axis,
    Widget childWhenDragging,
    Offset feedbackOffset = Offset.zero,
    DragAnchor dragAnchor = DragAnchor.child,
    int maxSimultaneousDrags,
    VoidCallback onDragStarted,
    DraggableCanceledCallback onDraggableCanceled,
    DragEndCallback onDragEnd,
    VoidCallback onDragCompleted,
    hapticFeedbackOnStart = true,
    bool ignoringFeedbackSemantics = true,
  }) : super(
            key: key,
            child: child,
            feedback: feedback,
            data: data,
            axis: axis,
            childWhenDragging: childWhenDragging,
            feedbackOffset: feedbackOffset,
            dragAnchor: dragAnchor,
            maxSimultaneousDrags: maxSimultaneousDrags,
            onDragStarted: onDragStarted,
            onDraggableCanceled: onDraggableCanceled,
            onDragEnd: onDragEnd,
            onDragCompleted: onDragCompleted,
            ignoringFeedbackSemantics: ignoringFeedbackSemantics,
            hapticFeedbackOnStart: hapticFeedbackOnStart);

  @override
  DelayedMultiDragGestureRecognizer createRecognizer(
      GestureMultiDragStartCallback onStart) {
    return DelayedMultiDragGestureRecognizer(delay: Duration(milliseconds: 300))
      ..onStart = (Offset position) {
        final Drag result = onStart(position);
        if (result != null && hapticFeedbackOnStart)
          HapticFeedback.selectionClick();
        return result;
      };
  }
}
