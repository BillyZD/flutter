
import 'package:flutter/material.dart';
import 'dart:math';


/*棋盘*/
class MyChessBoardPainter extends CustomPainter {

  MyChessBoardPainter({ required this.chessList , required this.squareNumber});

  final List<ChessModel> chessList;

  final int squareNumber;

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    double eWidth = size.width / squareNumber.toDouble();
    double eHeight = size.height / squareNumber.toDouble();

    var myPain = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill //填充
      ..color = Color(0x77cdb175); //背景为纸黄色

    canvas.drawRect(Offset.zero & size, myPain);

    //画棋盘网格
    myPain
      ..style = PaintingStyle.stroke //线
      ..color = Colors.black87
      ..strokeWidth = 1.0;
    for (int i = 0; i <= squareNumber; ++i) {
      double dy = eHeight * i;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), myPain);
    }
    for (int i = 0; i <= squareNumber; ++i) {
      double dx = eWidth * i;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), myPain);
    }

    myPain.style = PaintingStyle.fill;
    for (var model in this.chessList) {
      myPain.color = model.isBlack ? Colors.black : Colors.white;
      canvas.drawCircle(
          Offset( eWidth * model.point.x.toDouble(), eHeight * model.point.y.toDouble()),
          min(eWidth / 2, eHeight / 2) - 2, myPain);
    }

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    // throw UnimplementedError();
    return true;
  }

}

class ChessModel {

  ChessModel({ required this.point , required this.isBlack});

  final Point point;

  final bool isBlack;

}