
import 'package:flutter/material.dart';
import 'package:flutter_app/AppRoot/AppHomeWidget.dart';
import 'package:flutter_app/AppRoot/AppNewWidget.dart';
import 'package:flutter_app/AppRoot/AppFindWidget.dart';
import 'package:flutter_app/AppRoot/AppMineWidget.dart';

class AppRootWidget extends StatefulWidget {

  @override
  _AppRootWidgetState createState() => _AppRootWidgetState();
}

class _AppRootWidgetState extends State<AppRootWidget> {

  final List<Widget> pages = [
    AppHomeWidget(),
    AppNewWidget(),
    AppFindWidget(),
    AppMineWidget(),
  ];

  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.pink
      ),
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          currentIndex: this.currentIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '首页',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.new_label),
              label: '消息',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.find_replace),
              label: '发现',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.post_add),
              label: '我的',
            ),
          ],
          onTap: (index){
           setState(() {
             this.currentIndex = index;
           });
          },
        ),
        body: this.pages[currentIndex],
      ),
    );
  }
}
