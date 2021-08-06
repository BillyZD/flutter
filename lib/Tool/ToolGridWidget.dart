
import 'package:flutter/material.dart';

class ToolGridWidget extends StatelessWidget {

  const ToolGridWidget({Key? key , required this.row , required this.childAspectRatio , required this.list});

  final int row;

  final List<ToolDefaultGridModel>  list;

  /*宽度和高度的比例*/
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // 计算高度
    double itemWidth = width/row.toInt();
    double itemHeight = itemWidth/childAspectRatio;
    return Container(
      height: itemHeight * getColumn().toDouble(),
      color: Colors.white,
      child: GridView(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: childAspectRatio,
            crossAxisCount: this.row
        ),
        children: this.list.map((e) => getCell(e)).toList(),
      ),
    );
  }

  int getColumn() {
    int _row =  this.list.length~/this.row;
    if (this.list.length%this.row != 0) {
      _row = _row + 1;
    }
    return _row;
  }

  Widget getCell(ToolDefaultGridModel model) {
    return TextButton(
        onPressed: (){

        }, child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.center,
          children: [
            model.image,
            SizedBox(height: 5,),
            model.text,
         ],
       ),
      )
    );
  }

}


class ToolDefaultGridModel{

  ToolDefaultGridModel({required this.image , required this.text});

  final Image image;

  final Text text;

  static Text getText(String text) {
    return Text(text , style: TextStyle(
      fontSize: 14,
      color: Color.fromRGBO(51, 51, 51, 1),
    ),);
  }

  static List<ToolDefaultGridModel> getOrderTestModelList() {
    return [
      ToolDefaultGridModel(image: Image.asset('images/order_wait_pay.png') , text: ToolDefaultGridModel.getText('待付款')),
      ToolDefaultGridModel(image: Image.asset('images/order_payed.png') , text: ToolDefaultGridModel.getText('已付款')),
      ToolDefaultGridModel(image: Image.asset('images/order_refund.png') , text: ToolDefaultGridModel.getText('退款')),
      ToolDefaultGridModel(image: Image.asset('images/order_all.png') , text: ToolDefaultGridModel.getText('退款'))
    ];
  }

  static List<ToolDefaultGridModel> getMineTestModelList() {
    return [
      ToolDefaultGridModel(image: Image.asset('images/mine_booking.png') , text: ToolDefaultGridModel.getText('我的预约')),
      ToolDefaultGridModel(image: Image.asset('images/mine_consult.png') , text: ToolDefaultGridModel.getText('我的咨询')),
      ToolDefaultGridModel(image: Image.asset('images/mine_reward.png') , text: ToolDefaultGridModel.getText('我的奖品')),
    ];
  }

}