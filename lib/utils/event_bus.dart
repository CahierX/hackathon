//订阅者回调签名
typedef EventCallback = void Function(dynamic arg);

class EventBus {
  EventBus._internal();

  static final EventBus _singleton = EventBus._internal();

  factory EventBus() => _singleton;
  final dynamic _eventMapping = <Object, List<EventCallback>>{};

  //添加订阅者
  void on(eventName, EventCallback f) {
    if (eventName == null) return;
    _eventMapping[eventName] ??= <EventCallback>[];
    _eventMapping[eventName]!.add(f);
  }

  //移除订阅者
  void off(eventName, [EventCallback? f]) {
    var list = _eventMapping[eventName];
    if (eventName == null || list == null) return;
    if (f == null) {
      _eventMapping[eventName] = null;
    } else {
      list.remove(f);
    }
  }

  void emit(eventName, [arg]) {
    var list = _eventMapping[eventName];
    if (list == null) return;
    int len = list.length - 1;
    for (var i = 0; i < len; i++) {
      list[i](arg);
    }
  }
}

var bus = EventBus();
