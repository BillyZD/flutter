
import 'package:dio/dio.dart';

enum HttpMethod{
   get,
   post
}

/*
* 网络请求单利
*/
class NetWorkManager{

  NetWorkManager._internal();

  static NetWorkManager _netWorkManager = NetWorkManager._internal();

  factory NetWorkManager() { return _netWorkManager; }

  // 请求域名
  String _host = 'https://dev-www.yrdcarlife.com/';

  // 请求路径
  String _path = 'api';

  // 请求header
  Map<String , String> _header = {'source': 'Flutter'};

  /*
  *   设置host
  * */
  static void setHost({required String host}) {
    _netWorkManager._host = host;
  }

  /*
  * 获取请求对象
  * */
  static Dio _getSendRequestDio() {
    var dio = Dio();
    dio.options.baseUrl = _netWorkManager._host;
    _netWorkManager._header.forEach((key, value) {
      dio.options.headers[key] = value;
    });
    return dio;
  }

  /*
  *   发送请求
  * */
  static Future<Map<String , dynamic>?> request(String url ,
      Map<String , dynamic>? params,
      Function(String) failedHandle ,
      {HttpMethod method = HttpMethod.post}) async {
    var dio = _getSendRequestDio();
    var _url = '${_netWorkManager._path}/$url';
    print('请求地址:${_netWorkManager._host}$_url');
    print('请求参数$params');
    var response;
    if (method == HttpMethod.get) {
      response = await dio.get( _url, queryParameters: params);
    }else if (method == HttpMethod.post) {
      response = await dio.post(_url , data: params);
    }
    Map<String , dynamic> map = response.data;
    if (_checkNetWorkData(map)) {
      return map;
    }else {
      String err = map['message'] ?? '';
      failedHandle(err);
    }

  }

  static bool _checkNetWorkData(Map<String , dynamic> netWorkData) {
    int code = netWorkData["code"] ?? -1;
    return code == 0;
  }


}