
import 'package:flutter/material.dart';
import 'package:flutter_app/Tool/ToolSearchBar.dart';

class FindMainWidget extends StatefulWidget {
  const FindMainWidget({Key? key}) : super(key: key);

  @override
  _FindMainWidgetState createState() => _FindMainWidgetState();
}

class _FindMainWidgetState extends State<FindMainWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 18,right: 18),
      child: SafeArea(
        child: Column(
          children: [
            ToolSearchBar(
              onEditingComplete: (text){
                print('搜索$text');
              },
              placeholder: '请输入关键字',
            ),
          ],
        ),
      ),
    );
  }
}

