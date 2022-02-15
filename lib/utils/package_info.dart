/// @author: chenxiaoxi
/// @date: 2021/10/25
/// @description：packageInfo.dart
import 'package:package_info/package_info.dart';

// 读取yaml信息
Future<PackageInfo> getPackageInfo() async {
  final PackageInfo info = await PackageInfo.fromPlatform();
  return info;
}
