
import 'package:fluttertoast/fluttertoast.dart';


class ToolToast {

  /*显示中间toast*/
  static void showLongToast(String message , {int delay = 1}) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      fontSize: 15.0,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: delay,
    );
  }

}



