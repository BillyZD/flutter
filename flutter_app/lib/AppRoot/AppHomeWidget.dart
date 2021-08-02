

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      child: CustomScrollView(
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
                )
              )
          ),
          //SliverFillViewport(delegate: delegate)
          SliverFillRemaining(
            child: TabBarView(
              controller: this.tabController,
              children: [
                Container(
                  color: Colors.red,
                  child: GridView(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10, // 水平间距
                        mainAxisSpacing: 10,
                        childAspectRatio: 1.0 // 宽高的比例
                    ),
                    children: [
                      this.imageList[0],
                      this.imageList[1],
                      this.imageList[3]
                    ],
                    physics: NeverScrollableScrollPhysics(),
                  ),
                ),
                MediaQuery.removePadding(
                  context: context,
                  removeBottom: true,
                  removeTop: true,
                  child:  GridView.builder(
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
                  physics: NeverScrollableScrollPhysics(),
                ),
                )
              ],
            ),
          ),
        ],
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