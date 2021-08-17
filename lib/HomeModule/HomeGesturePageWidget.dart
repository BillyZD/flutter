
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';

class HomeGesturePageWidget extends StatefulWidget {

  const HomeGesturePageWidget({required this.widget , required this.insideController , required this.outsideController});

  final Widget widget;

  final ScrollController insideController;

  final ScrollController outsideController;

  @override
  _HomeGesturePageWidgetState createState() => _HomeGesturePageWidgetState();
}

class _HomeGesturePageWidgetState extends State<HomeGesturePageWidget> {

   Drag? drag;

   DragStartDetails? dragStartDetails;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

   @override
  Widget build(BuildContext context) {
    return NotificationListener(
      child: widget.widget,
      onNotification: handleNotification,
    );
  }

  bool handleNotification(ScrollNotification notification) {
    final ScrollMetrics metrics = notification.metrics;
     if (notification is ScrollEndNotification) {
       print('滑动结束1');
       this.drag = null;
     }
     // 垂直方向滑动
     if (metrics.axis == Axis.vertical) {
       // 滑动开始
       if(notification is ScrollStartNotification){
         if(notification.dragDetails == null) return true;
         //我们保存notification的 dragDetails，
         dragStartDetails = notification.dragDetails;
       }
       if (notification is UserScrollNotification) {
         if(metrics.pixels == metrics.minScrollExtent && notification.direction == ScrollDirection.reverse) {
           if (this.drag == null) {
             drag = widget.insideController.position.drag(this.dragStartDetails!, () {
               print('外部滑动结束2');
               drag = null;
             });
           }
         }else if (metrics.pixels == metrics.maxScrollExtent && notification.direction == ScrollDirection.forward) {
           if (this.drag == null) {
             drag = widget.insideController.position.drag(this.dragStartDetails!, () {
               print('外部滑动结束1');
               drag = null;
             });
           }
         }
       }
     }
     return true;
  }
}
