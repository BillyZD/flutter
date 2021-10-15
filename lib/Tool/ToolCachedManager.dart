
import 'package:shared_preferences/shared_preferences.dart';

class ToolCachedManager{

  static saveValueFoyKey({required String key , required String value}) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value).then((value) {
      print('缓存结果$value');
    });
  }

  static Future<String?> readStringForKey({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ;
  }

}