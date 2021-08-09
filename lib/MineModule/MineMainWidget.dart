
import 'package:flutter/material.dart';
import 'package:flutter_app/MineModule/MineHeaderWidget.dart';
import 'package:flutter_app/MineModule/MineCarAddInfoWidget.dart';
import 'package:flutter_app/Tool/ToolGridWidget.dart';
import 'package:flutter_app/Tool/ToolToastWidget.dart';
import 'package:flutter_app/MineModule/MineMainCellModel.dart';


/*我的主界面*/
class MineMainWidget extends StatefulWidget {

  MineMainWidget({Key? key }) : super(key: key);

  @override
  _MineMainWidgetState createState() => _MineMainWidgetState();
}

class _MineMainWidgetState extends State<MineMainWidget> {

  List<MineMainCellModel> list = MineMainCellModel.getMineActionData();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  /*处理点击列表*/
  void handleClickList(MineHomeActionType type){
    switch (type){
      case MineHomeActionType.feedBack:
        ToolToast.showLongToast('我的反馈');
        break;
      case MineHomeActionType.mineSet:
        ToolToast.showLongToast('我的设置');
        break;
      case MineHomeActionType.privateProtocol:
        ToolToast.showLongToast('隐私协议');
        break;
      case MineHomeActionType.userProtocol:
        ToolToast.showLongToast('用户协议');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    print('初始化build');
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              MineHeaderWidget(
                isLogin: false,
              ),
              SizedBox(height: 10,),
              MineCarAddInfoWidget(
                tapAddCar: (){
                  ToolToast.showLongToast('添加爱车');
                },
              ),
              SizedBox(height: 10,),
              ToolGridWidget(
                row: 4,
                childAspectRatio: 1.37,
                list: ToolDefaultGridModel.getOrderTestModelList(),
              ),
              SizedBox(height: 10,),
              ToolGridWidget(
                row: 4,
                childAspectRatio: 1.04,
                list: ToolDefaultGridModel.getMineTestModelList(),
              ),
            ],
          ),
        ),
        SliverPadding(padding: EdgeInsets.only(top: 10) ,
          sliver: SliverFixedExtentList(
            itemExtent: 60.0, // 高度
            delegate: new SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                //创建列表项
                return GestureDetector(
                  onTap: (){
                    this.handleClickList(this.list[index].type);
                  },
                  child: getListCell(this.list[index]),
                );
              },
              childCount: this.list.length
           ),
         ),
        ),
      ],
    );
  }

  Widget getListCell(MineMainCellModel model) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 16 , right: 16),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          model.icon,
          SizedBox(width: 10,),
          Expanded(child: Text(model.text , maxLines: 1, style: TextStyle(
            fontSize: 16,
            color: Color.fromRGBO(51, 51, 51, 1),
          ),)),
          SizedBox(width: 10,),
          Image.asset('images/right_row.png')
        ],
      ),
    );
  }
}




