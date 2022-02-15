/// @author: chenxiaoxi
/// @date: 2021/9/28
/// @description：connections_interceptor.dart
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';

class ConnectsInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    _request();
  }

  _request() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
    } else {
      print('没有网络');
      //在这里加一个错误弹窗
    }
  }
}
