import 'package:hackathon/utils/package_info.dart';

/// @author: chenxiaoxi
/// @date: 2021/9/28
/// @description：config.dart
///
class Config {
  static const String packageEnvLocal ="local";
  static const String packageEnvProduction ="production";
  static const String packageEnvDevelopment ="development";
  static const String packageEnvTest ="test";
  static const String version = "8.3.2";

  static late String env;
  String? packageInfo = "";
  Config() {
    print("init Config");
    getPackageInfo().then((value) => packageInfo = value.version);
  }
  // 获取接口访问的地址，区分环境
  static setConfig(ev) => env = ev;
  static String get apiHost {
    switch (env) {
      case "production":
        return "http://192.168.1.41:27018/";
      case "development":
        return "http://192.168.1.41:27018/";
      case "local":
      default:
        return "http://192.168.1.41:27018/";
    }
  }

  // 获取敲门IP地址，正式上线时候，IP地址为客户输入项
  static String get ipAddress {
    switch (env) {
      case "production":
        return "222.73.173.196";
      case "development":
        return "222.73.173.196";
      case "local":
      default:
        return "222.73.173.196";
    }
  }

  // 获取敲门IP地址，正式上线时候，IP地址为客户输入项
  static String get defaultDomain {
    switch (env) {
      case "production":
        return "222.73.173.196:9080";
      case "development":
        return "222.73.173.196:53200";
      case "test":
        return "222.73.173.196:63000";
      case "local":
        return "";
      default:
        return "222.73.173.196:9080";
    }
  }

  // 获取端口
  static getPort() {
    return 63000;
  }
}
