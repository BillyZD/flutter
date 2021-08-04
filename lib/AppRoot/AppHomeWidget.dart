

import 'package:flutter/material.dart';
import 'package:flutter_app/Animation/AnimationWidget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_app/Animation/PageRouteAnimation.dart';
import 'package:flutter_app/Login/VerityCodeLoginWidget.dart';

class AppHomeWidget extends StatefulWidget {
  @override
  _AppHomeWidgetState createState() => _AppHomeWidgetState();
}

class _AppHomeWidgetState extends State<AppHomeWidget> with SingleTickerProviderStateMixin {

  final List<Image> imageList = [
    Image.asset('images/img_4.jpg'),
    Image.asset('images/img_5.jpg'),
    Image.asset('images/img_6.jpg'),
    Image.asset('images/img_7.jpg'),
    Image.asset('images/img_8.jpg'),
    Image.asset('images/img_9.jpg'),
    Image.asset('images/img_9.jpg'),
    Image.asset('images/img_9.jpg'),
  ];

  late TabController tabController;

  ScrollController customerController = ScrollController();

  ScrollController grid1Controller = ScrollController();

  ScrollController grid2Controller = ScrollController();

  _MyVerticalDragGestureRecognizer _recognizer = _MyVerticalDragGestureRecognizer();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.tabController = TabController(length: 2, vsync: this);
    // this.customerController.addListener(() {
    //   print(this.customerController.offset);
    // });
    // this.gridController.addListener(() {
    //
    // });
    this.grid1Controller.addListener(() {
      print(this.grid1Controller.offset);
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: this.getCustomScrollView(width , context),
    );
  }

  Widget getCustomScrollView(double width , BuildContext context) {
    return  CustomScrollView(
      controller: this.customerController,
      slivers: [
        SliverAppBar(
          //toolbarHeight: 40,
          backgroundColor: Colors.red,
          pinned: true,
          // floating: true,
        ),
        SliverToBoxAdapter(
          child: Container(
            height: width * 9 / 16,
            color: Colors.yellow,
            child: Image.asset('images/img_1.jpg',fit: BoxFit.fitWidth,),
          ),
        ),
        SliverPersistentHeader(
            pinned: true,
            delegate: StickyTabBarDelegate(
                child: TabBar(
                  controller: this.tabController,
                  tabs: [
                    Tab(text:'分组一'),
                    Tab(text:'分组二'),
                  ],
                  labelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.label,
                )
            )
        ),
        //SliverFillViewport(delegate: delegate)
        SliverToBoxAdapter(
          child: Divider(
            color:  Color.fromRGBO(249, 249, 249, 1),
            height: 1,
          ),
        ),
        SliverFillRemaining(
          child: TabBarView(
            controller: this.tabController,
            children: [
              this.getFirstGroupWidget(width , context),
              this.getSecondGroupWidget()
            ],
          ),
        ),
      ],
    );
  }

  Widget getFirstGroupWidget(double width, BuildContext context) {
    return NotificationListener(
        onNotification: (notification){
          return true;
        },
        child: GridView(
          controller: grid2Controller,
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10, // 水平间距
              mainAxisSpacing: 10,
              childAspectRatio: 1.0 // 宽高的比例
          ),
          children: [
            GestureDetector(
              onTap: (){
                print('点击');
                PageRouteAnimationModel(page: VerityCodeLoginWidget()).pushBottomPage(context);
              },
              child: TweenAnimationWidget(begin: (width - 10)/2 - 50, end: (width - 10)/2, duration: 0.5, isReverse: false, child: this.imageList[0]),
            ),
            this.imageList[1],
            this.imageList[3]
          ],
          // physics: NeverScrollableScrollPhysics(),
        )
    );
  }

  Widget getSecondGroupWidget() {
    return NotificationListener(
        onNotification: (notification){
          print(notification);
          return false;
        },
        child:  GridView.builder(
          controller: this.grid1Controller,
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10, // 水平间距
              mainAxisSpacing: 10,
              childAspectRatio: 1.0 // 宽高的比例
          ), itemBuilder: (BuildContext cnt, int index) {
          return this.imageList[index];
        },
          itemCount: this.imageList.length,
          //  physics: NeverScrollableScrollPhysics(),
        )
    );
  }

}


class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {

  final TabBar child;

  StickyTabBarDelegate({required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: this.child,
    );
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
//
// SliverGrid(
// delegate: SliverChildBuilderDelegate(
// (BuildContext cnt, int index){
// return this.imageList[index];
// },
// childCount: this.imageList.length
// ),
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 2,
// crossAxisSpacing: 10, // 水平间距
// mainAxisSpacing: 10,
// childAspectRatio: 1.0 // 宽高的比例
// )
// )

class _MyVerticalDragGestureRecognizer extends VerticalDragGestureRecognizer {

  bool needDrag = true;

  @override
  // TODO: implement onUpdate
  GestureDragUpdateCallback? get onUpdate => this.needDrag ? super.onUpdate : null;

  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}
