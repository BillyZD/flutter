
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_app/Tool/ToolToastWidget.dart';
import 'package:flutter_app/NewModule/MyChessBoardPainter.dart';


class NewMainWidget extends StatefulWidget {
  const NewMainWidget({Key? key}) : super(key: key);

  @override
  _NewMainWidgetState createState() => _NewMainWidgetState();
}

class _NewMainWidgetState extends State<NewMainWidget> {

  bool isBlack = true;

  List<ChessModel> chessList = [];

  int squareNumber = 15;

  bool isWin = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Size size = Size(width - 30, width - 30);
    return Column(
      children: [
        Container(
            padding: EdgeInsets.only(left: 15 , top: 100),
            child: GestureDetector(
              child: CustomPaint(
                size: size,
                painter: MyChessBoardPainter(
                    squareNumber: this.squareNumber,
                    chessList: this.chessList
                ),
              ),
              onTapDown: (TapDownDetails details){
                if (this.isWin) {
                  ToolToast.showLongToast('${this.isBlack ? '黑棋' : '白棋'}已获胜');
                  return;
                }
                var point = this.getTapPoint(size, details.localPosition);
                if (point != null) {
                  var model = this.getChessModel(point);
                  if (model != null) {
                    this.chessList.add(model);
                    this.isWin = this.getIsWin();
                    if (this.isWin) {
                      ToolToast.showLongToast('${this.isBlack ? '黑棋' : '白棋'}已获胜');
                    }else {
                      this.isBlack = !this.isBlack;
                    }

                    setState(() {});
                  }else {
                    ToolToast.showLongToast('已存在棋子');
                  }
                }else {
                  ToolToast.showLongToast('无效位置');
                }
              },
            )
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) => Color.fromRGBO(255, 129, 59, 1))
              ),
              onPressed: (){
                this.chessList = [];
                this.isWin = false;
                setState(() {});
              },
              child: Container(
                width: 60,
                height: 30,
                child: Center(
                  child: Text('重来' ,style: TextStyle(
                    fontSize: 16,
                    color: Colors.white
                  ),),
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  /*获取点击的棋子模型*/
  ChessModel? getChessModel(Point point) {
    bool isExit = false;
    for (var model in this.chessList) {
      if (model.point.x == point.x && model.point.y == point.y) {
        isExit = true;
        break;
      }
    }
    if (!isExit) {
      return ChessModel(point: point, isBlack: this.isBlack);
    }
    return null;
  }

  /*获取点击的点*/
  Point? getTapPoint(Size size , Offset offset) {
    double offsetX = offset.dx;
    double offsetY = offset.dy;
    // 网格的宽度
    double eWidth = size.width / squareNumber.toDouble();
    // 有效点击范围
    double effectRange = eWidth/3;

    int? _x;
    for (var i = 0 ; i < this.squareNumber ; i ++) {
      double _offsetX = offsetX - eWidth * i.toDouble();
      _offsetX = _offsetX <= 0 ? -_offsetX : _offsetX;
      if (_offsetX <= effectRange) {
        _x = i;
        break;
      }
    }
    int? _y;
    for (var i = 0 ; i < this.squareNumber ; i ++) {
      double _offsetY = offsetY - eWidth * i.toDouble();
      _offsetY = _offsetY <=0 ? -_offsetY : _offsetY;
      if (_offsetY <= effectRange) {
        _y = i;
        break;
      }
    }
    if (_x != null && _y != null) {
      return Point(_x.toDouble(), _y.toDouble());
    }
    return null;
  }

  /*判断是否获胜*/
  bool getIsWin() {
    if (this.chessList.length < 8) {
      return false;
    }
    List<Point>  pointList = [];
    for (var model in this.chessList) {
      if (this.isBlack) {
        // 最后一手为黑子
        if (model.isBlack) {
          pointList.add(model.point);
        }
      }else {
        // 最后一手为白子
        if (!model.isBlack) {
          pointList.add(model.point);
        }
      }
    }
    // 从左向右，从上往下排序
    pointList.sort((object1 , object2) {
      if (object1.x == object2.x) {
        return object1.y.compareTo(object2.y);
      }
      return object1.x.compareTo(object2.x);
    });
    if (pointList.length >= 5) {
      for (var i = 0 ; i < pointList.length ; i ++) {
        // 水平方向
        List<Point> winListPoint = [
          pointList[i] ,
          Point(pointList[i].x + 1, pointList[i].y),
          Point(pointList[i].x + 2, pointList[i].y),
          Point(pointList[i].x + 3, pointList[i].y),
          Point(pointList[i].x + 4, pointList[i].y),
        ];
        if (_NewMainWidgetState.contains(pointList, winListPoint)) {
          return true;
        }
        // 垂直方向
        winListPoint = [
          pointList[i],
          Point(pointList[i].x, pointList[i].y + 1),
          Point(pointList[i].x, pointList[i].y + 2),
          Point(pointList[i].x, pointList[i].y + 3),
          Point(pointList[i].x, pointList[i].y + 4),
        ];
        if (_NewMainWidgetState.contains(pointList, winListPoint)) {
          return true;
        }
        // 斜右下
        winListPoint = [
          pointList[i],
          Point(pointList[i].x + 1, pointList[i].y + 1),
          Point(pointList[i].x + 2, pointList[i].y + 2),
          Point(pointList[i].x + 3, pointList[i].y + 3),
          Point(pointList[i].x + 4, pointList[i].y + 4),
        ];
        if (_NewMainWidgetState.contains(pointList, winListPoint)) {
          return true;
        }
        // 斜右上
        winListPoint = [
          pointList[i],
          Point(pointList[i].x + 1, pointList[i].y - 1),
          Point(pointList[i].x + 2, pointList[i].y - 2),
          Point(pointList[i].x + 3, pointList[i].y - 3),
          Point(pointList[i].x + 4, pointList[i].y - 4),
        ];
        if (_NewMainWidgetState.contains(pointList, winListPoint)) {
          return true;
        }
      }
    }
    return false;
  }

  /*判断数组是否包含子数组*/
  static bool contains(List list , List subList) {
    for (var value in subList) {
      if (list.contains(value) == false) {
        return false;
      }
    }
    return true;
  }

}


