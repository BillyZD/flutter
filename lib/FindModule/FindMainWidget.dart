
import 'package:flutter/material.dart';
import 'package:flutter_app/Tool/ToolSearchBar.dart';
import 'package:flutter_app/FindModule/RepairListWidget.dart';
import "package:pull_to_refresh/pull_to_refresh.dart";
import 'package:flutter_app/Animation/PageRouteAnimation.dart';
import 'package:flutter_app/FindModule/RepairDetailWidget.dart';

class FindMainWidget extends StatefulWidget {
  const FindMainWidget({Key? key}) : super(key: key);

  @override
  _FindMainWidgetState createState() => _FindMainWidgetState();
}

class _FindMainWidgetState extends State<FindMainWidget> {

  RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _refreshController.requestRefresh(duration: Duration(milliseconds: 250));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: SafeArea(
        child: Flex(
          direction: Axis.vertical,
          children: [
            Container(
              padding: EdgeInsets.only(left: 18,right: 18),
              child: ToolSearchBar(
                onEditingComplete: (text){
                  print('搜索$text');
                },
                placeholder: '请输入关键字',
                height: 40,
              ),
            ),
            Container(
              height: 15,
              color: Colors.white,
            ),
            Expanded(child:  SmartRefresher(
              enablePullUp: false,
              enablePullDown: true,
              controller: _refreshController,
             // header: WaterDropHeader(),
             // header: WaterDropMaterialHeader(),
              onRefresh: (){
                this.handleRefresh();
              },
              child: ListView.builder(
                itemBuilder: (cnx , index){
                  return GestureDetector(
                    onTap: (){
                      PageRouteAnimationModel(page: RepairDetailWidget()).defaultPage(context);
                    },
                    child: RepairListWidget(),
                  );
                },
                itemCount: 10,
              ),
            ))
          ],
        )
      ),
    );
  }

  void handleRefresh() {
    Future.delayed(Duration(seconds: 2),(){
      _refreshController.refreshCompleted();
    });
  }

}

