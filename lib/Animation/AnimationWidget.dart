
import 'package:flutter/material.dart';

/*动画过渡类封装*/
class GrowTransition extends StatelessWidget {

  final Widget child;

  final Animation<double> animation;

   GrowTransition({required this.child , required this.animation});

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget? child) {
            return new Container(
                height: animation.value,
                width: animation.value,
                child: child
            );
          },
          child: child
      ),
    );
  }
}

class TweenAnimationWidget extends StatefulWidget {

  final double begin;

  final double end;

  final double duration;

  final bool isReverse;

  final Widget child;

 TweenAnimationWidget({required this.begin , required this.end , required this.duration , required this.isReverse , required this.child});

  @override
  _TweenAnimationWidgetState createState() => _TweenAnimationWidgetState();
}

class _TweenAnimationWidgetState extends State<TweenAnimationWidget> with SingleTickerProviderStateMixin {

  AnimationController? controller;

  Animation<double>? animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this , duration: Duration(milliseconds: (widget.duration * 1000).toInt()));
    animation = Tween<double>(begin: widget.begin , end: widget.end).animate(controller!)..addListener(() {
      setState(() {

      });
    });
    if (widget.isReverse) {
      animation?.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller?.reverse();
        }
      });
    }
    /// 正方向执行
    controller?.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GrowTransition(child: widget.child, animation: this.animation!);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller?.dispose();
    super.dispose();
  }
}
