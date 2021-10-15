

import 'dart:convert' as convert;
import 'package:flutter_app/Category/String+Extension.dart';
import 'package:flutter_app/Tool/ToolCachedManager.dart';


extension MapCached on Map {

  /*
  *   缓存字典到本地
  */
  void savForKey({required String key}) {
    var jsonString = convert.jsonEncode(this);
    jsonString.savForKey(key: key);
  }

  /*
  *   读取缓存的字典
  */
  static Future<Map?> readValueForKey({ required String key}) async {
    var jsonString = await ToolCachedManager.readStringForKey(key: key);
    if (jsonString == null) {
      return null;
    }
    return convert.jsonDecode(jsonString);
  } 
  
}




