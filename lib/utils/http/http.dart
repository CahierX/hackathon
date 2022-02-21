import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:hackathon/config/config.dart';
import 'package:hackathon/utils/http/request_interceptor.dart';
import 'connections_interceptor.dart';

class Https {
  ///超时时间
  static const int connectTimeout = 5000;
  static const int receiveTimeout = 5000;

  static Https instance = Https._internal();

  factory Https() => instance;

  Dio dio = Dio();
  final CancelToken _cancelToken = CancelToken();

  Https._internal() {
    dio.options
      ..baseUrl = Config.apiHost
      ..contentType = Headers.jsonContentType
      ..responseType = ResponseType.json
      ..connectTimeout = connectTimeout
      ..receiveTimeout = receiveTimeout
      ..validateStatus = (int? status) {
        return status != null && status > 0;
      }
      ..headers = {};
    dio.interceptors.add(RequestInterceptor()); // 自定义拦截
    dio.interceptors.add(ConnectsInterceptor()); //拦截网络
    dio.interceptors.add(LogInterceptor()); //拦截网络
  }

  //这个在main或者初始化的时候先调用一下,设置自定义配置
  void init(
      {String? baseUrl,
      int? connectTimeout,
      int? receiveTimeout,
      List<Interceptor>? interceptors}) {
    dio.options = dio.options.copyWith(
        baseUrl: baseUrl,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout);
    if (interceptors != null && interceptors.isNotEmpty) {
      dio.interceptors.addAll(interceptors);
    }
  }

  /// 设置headers
  void setHeaders(Map<String, dynamic> map) {
    dio.options.headers.addAll(map);
  }

/*
   * 取消请求
   * 同一个cancel token 可以用于多个请求，当一个cancel token取消时，所有使用该cancel token的请求都会被取消。
   * 所以参数可选
   */
  void cancelRequests({CancelToken? token}) {
    token ?? _cancelToken.cancel("cancelled");
  }

  Future get(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
    bool refresh = false,
    bool noCache = true,
    String? cacheKey,
    bool cacheDisk = false,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions = requestOptions.copyWith(extra: {
      "refresh": refresh,
      "noCache": noCache,
      "cacheKey": cacheKey,
      "cacheDisk": cacheDisk,
    });
    Response response;
    response = await dio.get(path,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken);
    return response.data;
  }

  Future post(
    String path, {
    Map<String, dynamic>? params,
    data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    Options requestOptions = options ?? Options();
    var response = await dio.post(path,
        data: data,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken);
    return response.data;
  }

  Future put(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    Options requestOptions = options ?? Options();
    var response = await dio.put(path,
        data: data,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken);
    return response.data;
  }

  Future patch(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    Options requestOptions = options ?? Options();
    var response = await dio.patch(path,
        data: data,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken);
    return response.data;
  }

  Future delete(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    Options requestOptions = options ?? Options();
    var response = await dio.delete(path,
        data: data,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken);
    return response.data;
  }

  Future postForm(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    Options requestOptions = options ?? Options();
    var data = FormData.fromMap(params!);
    var response = await dio.post(path,
        data: data,
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken);
    return response.data;
  }
}

Future httpGet(
    {@required url, Map<String, dynamic>? data, Options? options}) async {
  return Https.instance.get(url, params: data, options: options);
}

Future httpPost(
    {@required url, Map<String, dynamic>? data, Options? options}) async {
  return Https.instance.post(url, data: data, options: options);
}

Future httpPut(
    {@required url, Map<String, dynamic>? data, Options? options}) async {
  return Https.instance.put(url, data: data, options: options);
}

Future httpPatch(
    {@required url, Map<String, dynamic>? data, Options? options}) async {
  return Https.instance.patch(url, data: data, options: options);
}

Future httpDelete(
    {@required url, Map<String, dynamic>? data, Options? options}) async {
  return Https.instance.delete(url, data: data, options: options);
}
