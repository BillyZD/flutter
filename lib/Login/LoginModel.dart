
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

}