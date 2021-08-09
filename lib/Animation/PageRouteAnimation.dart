
import 'package:flutter/material.dart';

class PageRouteAnimationModel {

  PageRouteAnimationModel({required this.page});

  final Widget page;

  /*默认弹出*/
  Future defaultPage(BuildContext context) {
    return Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
      return this.page;
    }));
  }

  /*从底部弹出*/
  Future pushBottomPage(BuildContext context) {
    return Navigator.push(context, this._createBottomRoute());
  }

  Route _createBottomRoute() {
     return PageRouteBuilder(
         pageBuilder: (context, animation, secondaryAnimation) => this.page,
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           var begin = Offset(0.0, 1.0);
           var end = Offset(0.0, 0.0);
           var tween = Tween(begin: begin, end: end);
           var offsetAnimation = animation.drive(tween);
           return SlideTransition(
             position: offsetAnimation,
             child: child,
           );
         }
     );
   }
}

