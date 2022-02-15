/// @author: chenxiaoxi
/// @date: 2021/9/28
/// @description：app_exceptions.dart
import 'package:dio/dio.dart';

/// 自定义异常
class AppException implements Exception {
  final String? _message;
  final int? _code;

  AppException([
    this._code,
    this._message,
  ]);

  @override
  String toString() {
    return "$_message($_code)";
  }

  factory AppException.create(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        {
          return BadRequestException(-1, "请求取消");
        }
      case DioErrorType.connectTimeout:
        {
          return BadRequestException(-1, "请求超时");
        }
      case DioErrorType.sendTimeout:
        {
          return BadRequestException(-1, "发送超时");
        }
      case DioErrorType.receiveTimeout:
        {
          return BadRequestException(-1, "响应超时");
        }
      case DioErrorType.response:
        {
          try {
            int? errCode = error.response?.statusCode!;
            // String errMsg = error.response.statusMessage;
            // return ErrorEntity(code: errCode, message: errMsg);
            switch (errCode) {
              case 400:
                {
                  return BadRequestException(errCode, "请求错误");
                }
              case 401:
                {
                  return UnauthorisedException(errCode!, "未授权");
                }
              case 403:
                {
                  return UnauthorisedException(errCode!, "登录过期");
                }
              case 404:
                {
                  return UnauthorisedException(errCode!, "请求错误");
                }
              case 405:
                {
                  return UnauthorisedException(errCode!, "请求405");
                }
              case 500:
                {
                  return UnauthorisedException(errCode!, "请求500");
                }
              case 502:
                {
                  return UnauthorisedException(errCode!, "请求502");
                }
              case 503:
                {
                  return UnauthorisedException(errCode!, "请求503");
                }
              case 505:
                {
                  return UnauthorisedException(errCode!, "请求505");
                }
              default:
                {
                  return AppException(
                      errCode, error.response?.statusMessage ?? '');
                }
            }
          } on Exception catch (_) {
            return AppException(-1, "未知错误");
          }
        }
        break;
      default:
        {
          return AppException(-1, error.message);
        }
    }
  }
}

/// 请求错误
class BadRequestException extends AppException {
  BadRequestException([int? code, String? message]) : super(code!, message!);
}

/// 未认证异常
class UnauthorisedException extends AppException {
  UnauthorisedException([int code = -1, String message = ''])
      : super(code, message);
}
