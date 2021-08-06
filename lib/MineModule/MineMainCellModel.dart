
import 'package:flutter/material.dart';

/*我的主界面列表模型*/
class MineMainCellModel{

  MineMainCellModel({ required this.type , required this.text , required this.icon});

  final MineHomeActionType type;

  final String text;

  final Image icon;

  /*获取我的界面列表数据*/
  static List<MineMainCellModel> getMineActionData() {
    return [
      MineMainCellModel(type: MineHomeActionType.feedBack , text: '我的反馈' , icon: Image.asset('images/mine_feedback.png')),
      MineMainCellModel(type: MineHomeActionType.privateProtocol , text: '隐私政策' , icon: Image.asset('images/mine_private.png')),
      MineMainCellModel(type: MineHomeActionType.userProtocol , text: '用户协议' , icon: Image.asset('images/mine_protocol.png')),
      MineMainCellModel(type: MineHomeActionType.mineSet , text: '我的设置' , icon: Image.asset('images/mine_set.png')),
    ];
  }

}

/*我的首页事件枚举*/
enum MineHomeActionType {

  /*意见反馈*/
  feedBack,

  /*隐私政策*/
  privateProtocol,

  /*用户协议*/
  userProtocol,

  /*我的设置*/
  mineSet

}