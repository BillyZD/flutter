

import 'package:flutter/material.dart';
import 'package:flutter_app/Animation/AnimationWidget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_app/Animation/PageRouteAnimation.dart';
import 'package:flutter_app/Login/VerityCodeLoginWidget.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/HomeModule/HomeGesturePageWidget.dart';

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

  late Drag? drag;

  late DragStartDetails? dragStartDetails;

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
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: this.getCustomScrollView(width , context),
    );
  }

  Widget getCustomScrollView(double width , BuildContext context) {
    return NotificationListener(
      onNotification: (ScrollNotification notification) {
        print('背景滚动');
        final ScrollMetrics metrics = notification.metrics;
        if (metrics.pixels == metrics.maxScrollExtent) {
          this.drag = null;
        }
        return true;
      },
        child: CustomScrollView(
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

                  NotificationListener(
                    child: this.getFirstGroupWidget(width, context),
                  ),

                  NotificationListener(
                    onNotification: (ScrollNotification notification) {
                      print('2滚动');
                      final ScrollMetrics metrics = notification.metrics;
                      if(notification is ScrollStartNotification){
                        if(notification.dragDetails == null) return true;
                        //我们保存notification的 dragDetails，
                        dragStartDetails = notification.dragDetails;
                      }
                      if (notification is UserScrollNotification) {
                        if(metrics.pixels == metrics.minScrollExtent && notification.direction == ScrollDirection.reverse){
                          if (this.drag == null) {
                            drag = this.customerController.position.drag(this.dragStartDetails!, () {
                              print('外部滑动结束2');
                              drag = null;
                            });
                          }
                        }
                      }
                      return true;
                    },
                    child: this.getSecondGroupWidget(),
                  )

                ],
              ),
            ),
          ],
        )
    );
  }

  Widget getFirstGroupWidget(double width, BuildContext context) {
    return GridView(
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
    );
  }

  Widget getSecondGroupWidget() {
    return GridView.builder(
      controller: this.grid1Controller,
      shrinkWrap: true,
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
