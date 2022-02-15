/// @author: chenxiaoxi
/// @date: 2021/9/28
/// @description：request_interceptor.dart
import 'dart:convert';

import 'package:dio/dio.dart';

import 'app_exceptions.dart';

/// 请求处理拦截器
class RequestInterceptor extends Interceptor {
  @override
  onRequest(options, handler) {
    // 请求携带token
    // var token = LocalStorage().getStorage('token');
    // if (token != null) options.headers["Authentication"] = token;
    if (options.data?.runtimeType == FormData) {
      options.headers['content-type'] = 'multipart/form-data';
    }
    handler.next(options);
  }

  @override
  onResponse(response, handler) {
    print(jsonEncode(response.data));
    if (response.data['code'].toString() == "200") {
      handler.next(response);
    } else if (response.data['errorCode'].toString() == "0") {
      handler.next(response);
    } else {
      handler.reject(DioError(
          requestOptions: response.requestOptions,
          error: response.data != null &&
                  response.data is Map &&
                  response.data['msg'] != null &&
                  response.data['msg'].length > 0
              ? response.data['msg']
              : '未知错误',
          response: response));
    }
  }

  @override
  onError(err, handler) {
    AppException appException = AppException.create(err);
    err.error = appException;
    // showTopSnackBar(
    //   context,
    //   CustomSnackBar.error(
    //     message: "$errorCode:域名错误或网络不通",
    //   ),
    // );
    return super.onError(err, handler);
  }
}
