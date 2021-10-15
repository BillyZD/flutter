
import 'package:flutter_app/Service/NetWorkManager.dart';
import 'package:flutter_app/Category/Map+Extension.dart';

/*登录模型*/
class LoginModel{

  /*手机号最大长度*/
  int maxPhoneCount = 11;

  /*验证码最大长度*/
  int maxVerityCode = 4;

  /*是否选中协议*/
  bool isSelectProtocol = false;

  /*手机号*/
  String? phoneText;

  /*验证码*/
  String? verityCode;

  static String _key = 'LoginModel_local_key';


  /*信息是否输入完成*/
  bool isComplete() {
    if (this.getErrText() == null){
      return true;
    }
    return false;
  }

  /*获取错误信息*/
  String? getErrText() {
    if (this.phoneText == null || this.phoneText?.length != this.maxPhoneCount){
      return '请输入正确的手机号';
    }else if (this.verityCode == null || this.verityCode?.length != this.maxVerityCode){
      return '请输入正确的验证码';
    }else if (!this.isSelectProtocol) {
      return '请同意协议';
    }
    return null;
  }

  void saveToLocal() {
     Map<String , dynamic> map = {'phone': this.phoneText ?? '', 'code': this.verityCode ?? '' , 'isSelect': this.isSelectProtocol};
     print('缓存登录账号信息到本地$map');
    map.savForKey(key: LoginModel._key);
  }

  static readFormLocal(Function(LoginModel?) callBack) {
      MapCached.readValueForKey(key: LoginModel._key).then((value) {
        if (value != null){
          var model = LoginModel();
          model.isSelectProtocol = value['isSelect'];
          model.verityCode = value['code'];
          model.phoneText = value['phone'];
          print(model.verityCode);
          callBack(model);
        }else {
          callBack(null);
        }
      });
  }

  void sendLoginRequest() {
    var params = this._getParams();
    NetWorkManager.request('account/auth/appSmsLogin', params, (err){
      print(err);
    }).then((value) {
      print('请求结果$value');
    });
  }

  Map<String , dynamic> _getParams() {
    return {'phone': this.phoneText , 'verifyCode': this.verityCode};
  }

}