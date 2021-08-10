
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/Tool/ToolToastWidget.dart';

class ToolSearchBar extends StatefulWidget {

  const ToolSearchBar({Key? key , required this.onEditingComplete , this.textChange ,required this.placeholder , this.height = 48}) ;

  /*结束编辑的回调*/
  final Function(String) onEditingComplete;

  /*输入框文字变化*/
  final Function(String)? textChange;

  /*站位文字*/
  final String placeholder;

  /*输入框高度*/
  final double height;

  @override
  _ToolSearchBarState createState() => _ToolSearchBarState();
}

class _ToolSearchBarState extends State<ToolSearchBar> {

  /*输入框编辑*/
  TextEditingController textEditingController = TextEditingController();

  /*控制手机号输入框键盘*/
  FocusNode focus = FocusNode();

  /*是否显示输入框*/
  bool isShowTextField = false;

  /*是否显示站位*/
  bool isShowPlaceHolder = true;

  /*holder对齐方式 （用来做动画）*/
  AlignmentDirectional _holderAlign = AlignmentDirectional.center;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController.addListener(() {
      if (this.textEditingController.text.isEmpty && !this.focus.hasFocus) {
        // 恢复到初始状态
        this.reSetState();
      }else if (this.textEditingController.text.isNotEmpty){
        /*输入框文字变化*/
        ToolToast.showLongToast(this.textEditingController.text);
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    this.focus.dispose();
    this.textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(246, 246, 246, 1),
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      padding: EdgeInsets.only(left: 12,right: 12),
      height: widget.height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Offstage(
            offstage: !isShowTextField, // 是否隐藏
            child: Container(
              child: this.createTextField(),
              height: widget.height,
            ),
          ),
          Offstage(
            offstage: !isShowPlaceHolder,
            child: Container(
              child: this.createPlaceHolder(),
              height: widget.height,
              width: 350,
            ),
          )
        ],
      ),
    );
  }

  Widget createTextField() {
    return CupertinoTextField.borderless(
      controller: this.textEditingController,
      focusNode: this.focus,
      textInputAction: TextInputAction.search,
      clearButtonMode: OverlayVisibilityMode.editing,
      placeholder: widget.placeholder,
      placeholderStyle: TextStyle(
        fontSize: 14,
        color: Color.fromRGBO(150, 150, 150, 1)
      ),
      prefix:Icon(Icons.search , color: Color.fromRGBO(150, 150, 150, 1), size: 25,),
      onEditingComplete: (){
        print('输入完成');
        widget.onEditingComplete(this.textEditingController.text);
        this.focus.unfocus();
      },
      onChanged: (text){
        print('改变$text');
        print(this.textEditingController.text);
      },
    );
  }

  Widget createPlaceHolder() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque, //点击空白也响应事件
      child: AnimatedAlign(
        duration: Duration(milliseconds: 250),
        alignment: _holderAlign,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.search , color: Color.fromRGBO(150, 150, 150, 1), size: 25,),
            SizedBox(width: 5,),
            Text(widget.placeholder, style: TextStyle(
              fontSize: 14,
              color: Color.fromRGBO(150, 150, 150, 1)
            ),)
          ],
        ),
        onEnd: (){
          print('动画结束');
          if ( _holderAlign == AlignmentDirectional.centerStart){
            this.isShowTextField = true;
            this.isShowPlaceHolder = false;
            setState(() {
              this.focus.requestFocus();
            });
          }
        },
      ),
      onTap: (){
        // 点击
        setState(() {
          if (_holderAlign == AlignmentDirectional.centerStart){
            _holderAlign = AlignmentDirectional.center;
          }else {
            _holderAlign = AlignmentDirectional.centerStart;
          }
        });
      },
    );
  }

  void reSetState() {
    this.isShowPlaceHolder = true;
    this.isShowTextField = false;
    setState(() {
      _holderAlign = AlignmentDirectional.center;
    });
  }

}
