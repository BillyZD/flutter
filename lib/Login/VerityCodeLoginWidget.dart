
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Tool/TimerButtonWidget.dart';
import 'package:flutter_app/Tool/ToolToastWidget.dart';

/*登录界面*/
class VerityCodeLoginWidget extends StatefulWidget {

  const VerityCodeLoginWidget({Key? key}) : super(key: key);

  @override
  _VerityCodeLoginWidgetState createState() => _VerityCodeLoginWidgetState();
}

class _VerityCodeLoginWidgetState extends State<VerityCodeLoginWidget> {

  /*是否选中协议*/
  bool isSelect = false;

  /*按钮是否为可选中状态*/
  bool isAllowLogin = false;

  /*监听手机号输入框*/
  TextEditingController phoneController = TextEditingController();

  /*控制手机号输入框键盘*/
  FocusNode focus = FocusNode();

  /*监听验证码输入框*/
  TextEditingController verityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation:0,
        leading: IconButton(
          icon: Image.asset('images/img_x.png'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          // 触摸收起键盘
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
            color: Colors.white,
            child: Flex(
              direction: Axis.vertical,
              children: [
                Expanded(child: SingleChildScrollView(
                    child: Column(
                      children: [
                        this.getHeaderTextWidget(width),
                        SizedBox(height: 30,),
                        this.getPhoneTextFieldWidget(),
                        SizedBox(height: 10,),
                        this.getVerityCodeTextFieldWidget(),
                        SizedBox(height: 40,),
                        this.getLoginButton(),
                        SizedBox(height: 18,),
                        Center(child: this.getRichText(),)
                      ],
                    )
                ))
              ],
            )
        ),
      )
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    phoneController.addListener(() {
      this.updateWidget();
    });
    verityController.addListener(() {
      this.updateWidget();
    });
  }

  void handleClickUserProtocol() {
    ToolToast.showLongToast('点击用户协议');
  }

  void handleClickPrivateProtocol() {
    ToolToast.showLongToast('点击隐私条款');
  }

  /*更新界面状态*/
  void updateWidget(){
    if (this.isSelect && phoneController.text.isNotEmpty && verityController.text.isNotEmpty) {
      this.isAllowLogin = true;
    }else {
      this.isAllowLogin = false;
    }
    setState(() {});
  }

  /*发送验证码请求*/
  bool sendGetVerityCodeRequest() {
    String phone = phoneController.text;
    bool isAllow = phone.length == 11;
    if (isAllow) {
      this.focus.unfocus();
    }else {
      ToolToast.showLongToast('请输入手机号');
    }
    return isAllow;
  }

  /*获取顶部文字显示*/
  Widget getHeaderTextWidget(double width) {
    return Container(
      padding: EdgeInsets.only(left: 25),
      width: width,
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('欢迎来到',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(51, 51, 51, 1),
            ),
          ),
          SizedBox(height: 6,),
          Text('长三角车生活平台',
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(51, 51, 51, 1)
            ),
          )
        ],
      ),
    );
  }

  Widget getPhoneTextFieldWidget() {
    return Container(
      height: 60,
      padding: EdgeInsets.only(left: 25 , right: 35),
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.phone,
            controller: phoneController,
            focusNode: this.focus,
            style: TextStyle(
                color: Color.fromRGBO(51, 51, 51, 1),
                fontSize: 16
            ),
            decoration: InputDecoration(
                hintText: '请输入手机号',
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(204, 204, 204, 1)
                ),
                border: InputBorder.none
            ),
          ),
          Divider(color: Color.fromRGBO(228, 228, 228, 1), height: 0.5,)
        ],
      )
    );
  }

  Widget getVerityCodeTextFieldWidget() {
    return Container(
      height: 60,
      padding: EdgeInsets.only(left: 25 , right: 30),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: verityController,
                  style: TextStyle(
                    color: Color.fromRGBO(51, 51, 51, 1),
                    fontSize: 16
                  ),
                  decoration: InputDecoration(
                      hintText: '请输入验证码',
                      hintStyle: TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(204, 204, 204, 1)
                      ),
                      border: InputBorder.none
                  ),
                ),
              ),
              SizedBox(width: 8),
              Container(
                width: 0.5,
                height: 12,
                padding: EdgeInsets.only(top: (60 - 12)/2),
                color: Color.fromRGBO(228, 228, 228, 1),
              ),
              SizedBox(width: 8),
              TimerButtonWidget(
                onPress: (){
                  return this.sendGetVerityCodeRequest();
                },
              )
            ],
          ),
          Divider(color: Color.fromRGBO(228, 228, 228, 1), height: 0.5,)
        ],
      )
    );
  }

  /*获取底部登录按钮*/
  Widget getLoginButton() {
    return Container(
      height: 60,
      padding: EdgeInsets.only(left: 35 , right: 35),
      child: Row(
        children: [
          Expanded(child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                //默背景颜色
                if (this.isAllowLogin) {
                  return Color.fromRGBO(255, 129, 59, 1);
                }
                return Color.fromRGBO(204, 204, 204, 1);
              }),
            ),
            onPressed: (){

            },
            child: Container(
              height: 60,
              child: Center(
                child: Text('登录',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
              )
            )
          ),
          )
        ],
      )
    );
  }

  /*获取富文本的展示*/
  Widget getRichText() {
    return Container(
      child: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 12 , color: Color.fromRGBO(153, 153, 153, 1)),
          children: [
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: GestureDetector(
                child: this.isSelect ? Image.asset('images/selected_box.png') : Image.asset('images/unSelect_box.png'),
                onTap: (){
                  this.isSelect = !this.isSelect;
                  this.updateWidget();
                },
              ),
            ),
            WidgetSpan(
              child: Container(
                width: 5,
              ),
            ),
            TextSpan(
              text: '我已阅读并同意',
            ),
            TextSpan(
              text: '《用户协议》',
              style: TextStyle(fontSize: 12,color: Color.fromRGBO(255, 129, 59, 1)),
              recognizer: TapGestureRecognizer()..onTap = () {
                this.handleClickUserProtocol();
              }
            ),
            TextSpan(
              text: '和'
            ),
            TextSpan(
                text: '《隐私条款》',
                style: TextStyle(fontSize: 12,color: Color.fromRGBO(255, 129, 59, 1)),
                recognizer: TapGestureRecognizer()..onTap = () {
                  this.handleClickPrivateProtocol();
                }
            ),
          ]
        ),
      ),
    );
  }
}
