
import 'package:flutter/material.dart';
import 'dart:async';

/*定时器button*/
class TimerButtonWidget extends StatefulWidget {

  final String defaultText;

  final String isSendText;

  final String reSendText;

  final int maxCount;

  final bool Function() onPress;

  TimerButtonWidget({
    Key? key,
    required this.onPress,
    this.defaultText = '获取验证码',
    this.isSendText = '后重发',
    this.reSendText = '重新发送',
    this.maxCount = 60,
  });

  @override
  _TimerButtonWidgetState createState() => _TimerButtonWidgetState();
}

class _TimerButtonWidgetState extends State<TimerButtonWidget> {

  late int _maxCount;

  late String _defaultText;

  Timer? _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _maxCount = widget.maxCount;
    _defaultText = widget.defaultText;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: TextButton(
        onPressed: (){
          this.clickSendButton();
        },
        child: Text(this._defaultText,
          style: TextStyle(
            fontSize: 16,
            color: Color.fromRGBO(255, 129, 59, 1),
          )
        ),
      ),
    );
  }
  /*点击发送按钮*/
  void clickSendButton() {
    if (this._timer?.isActive == true) {
      print('正在倒计时');
      return;
    }
    bool res = widget.onPress();
    if (!res) {
      return;
    }
    this._defaultText = '$_maxCount' + 'S${widget.isSendText}';
    setState(() {});
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      this.handleTimerAction();
    });
  }

  /*定时器事件*/
  void handleTimerAction() {
    if (this._maxCount >= 1) {
      this._maxCount = this._maxCount - 1;
      this._defaultText = '$_maxCount' + 'S${widget.isSendText}';
    }else {
      _timer?.cancel();
      this._maxCount = widget.maxCount;
      this._defaultText = widget.reSendText;
    }
    if (mounted) {
      setState(() {});
    }
  }

}
