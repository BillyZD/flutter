
import 'package:flutter_app/Tool/ToolCachedManager.dart';

extension StringCached on String {

  static var phoneKey = 'phone';

  /*
  * 读取缓存的手机号
  */
  static Future<String?> readPhone() async {
    var phone = ToolCachedManager.readStringForKey(key: StringCached.phoneKey);
    return phone;
  }

  /*
  * 缓存数据到本地
  */
  void savForKey({required String key}) {
    ToolCachedManager.saveValueFoyKey(key: key, value: this);
  }





}