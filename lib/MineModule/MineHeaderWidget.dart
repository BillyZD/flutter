
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/Animation/PageRouteAnimation.dart';
import 'package:flutter_app/Login/VerityCodeLoginWidget.dart';

/*我的界面的Header*/
class  MineHeaderWidget extends StatelessWidget {

  MineHeaderWidget ({Key? key , required this.isLogin});

  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    double safeTop = MediaQuery.of(context).padding.top;
    return Container(
        height: safeTop + 175,
        color: Color.fromRGBO(255, 129, 59, 1),
        padding: EdgeInsets.only(left: 35 , top: (175 - 72)/2 + 5),
        child: GestureDetector(
          onTap: (){
            PageRouteAnimationModel(page: VerityCodeLoginWidget()).pushBottomPage(context);
          },
          child: Row(
            children: [
              Image.asset('images/mine_place_icon.png'),
              SizedBox(width: 12,),
              Flexible(child: this.getUserInfoWidget()),
            ],
          ),
        )
    );
  }

  Widget getUserInfoWidget(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(isLogin ? '张小西' : '登录/注册' , maxLines: 1 , overflow: TextOverflow.ellipsis, style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.w600
        ),),
        SizedBox(height: 5,),
        Text('登录后体验更多功能' , maxLines: 1 , overflow: TextOverflow.ellipsis, style: TextStyle(
          fontSize: 14,
          color: Colors.white,
        ),)
      ],
    );
  }
}



