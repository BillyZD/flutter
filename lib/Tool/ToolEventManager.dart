

//订阅者回调签名
typedef void EventCallback(arg);

var bus = ToolEventManager();

/*
 *  事件广播订阅单利
 * */
class ToolEventManager {

  // 私有化构造函数
  ToolEventManager._internal();

  // 静态变量保存单利
  static ToolEventManager _manager = ToolEventManager._internal();

  // 工厂方法
  factory ToolEventManager() { return _manager; }

  // 订阅的对象
  Map<Object , List<EventCallback>> _subscribeMap =  Map<Object , List<EventCallback>>();

  /*添加订阅*/
  void on(eventName , EventCallback callback) {
    if (eventName == null) {return;}
    _subscribeMap[eventName] ??= <EventCallback>[];
    _subscribeMap[eventName]!.add(callback);
  }

  /*添加订阅*/
  static void oN(eventName , EventCallback callback)  {
    print(ToolEventManager._internal() == bus);
    if (eventName == null) {return;}
    ToolEventManager._manager._subscribeMap[eventName] ??= <EventCallback>[];
    ToolEventManager._manager._subscribeMap[eventName]!.add(callback);
  }

  /*移除订阅*/
  void off(eventName , [EventCallback? callback]) {
    var list = _subscribeMap[eventName];
    if (eventName == null || list == null) {return;}
    if (callback == null) {
      _subscribeMap[eventName] = [];
    }else {
      list.remove(callback);
    }
  }

  /*移除订阅*/
  static oFF(eventName , [EventCallback? callback]) {
    var list = ToolEventManager._manager._subscribeMap[eventName];
    if (eventName == null || list == null) { return; }
    if (callback == null) {
      ToolEventManager._manager._subscribeMap[eventName] = [];
    }else {
      list.remove(callback);
    }
  }

  /*触发事件*/
  void postEvent(eventName,[arg]) {
    var list = this._subscribeMap[eventName];
    if (list == null) { return; }
    int count = list.length - 1;
    // 逆序遍历
    for (var i = count ; i > -1 ; --i) {
      list[i](arg);
    }
  }

}