/// @author: chenxiaoxi
/// @date: 2021/9/29
/// @description：index.dart
import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:device_info/device_info.dart';

class PlatformInfo {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  static bool _isAndroid = false;
  static bool _isIos = false;
  static bool _isWeb = false;
  static PlatformInfo instance = PlatformInfo._internal();

  factory PlatformInfo() => instance;

  PlatformInfo._internal();

  Future getPlatformInfo() async {
    Map map = {};
    String name = "";
    if (isAndroid()) name = "android";
    if (isIos()) name = "ios";
    if (isWeb()) name = "web";
    if (isMacOS()) name = "macOS";
    if (isLinux()) name = "linux";
    if (isWindows()) name = "windows";
    dynamic info = await initPlatformState();
    map.addAll({"info": info});
    map.addAll({"platform": name});
    return map;
  }

  bool isAndroid() {
    return _isAndroid;
  }

  bool isIos() {
    return _isIos;
  }

  bool isWeb() {
    return _isWeb;
  }

  bool isMacOS() {
    return Platform.isMacOS;
  }

  bool isLinux() {
    return Platform.isLinux;
  }

  bool isWindows() {
    return Platform.isWindows;
  }

  Future<Map<String, dynamic>> initPlatformState() async {
    Map<String, dynamic> deviceData = <String, dynamic>{};
    try {
      if (Platform.isAndroid) {
        _isAndroid = true;
        deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      } else if (Platform.isIOS) {
        _isIos = true;
        deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
      }
    } on PlatformException {
      _isWeb = true;
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }
    return deviceData;
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.androidId,
      'systemFeatures': build.systemFeatures,
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }
}

bool isAndroid() {
  return PlatformInfo.instance.isAndroid();
}

bool isIos() {
  return PlatformInfo.instance.isIos();
}

bool isWeb() {
  return PlatformInfo.instance.isWeb();
}

bool isMacOS() {
  return PlatformInfo.instance.isMacOS();
}

bool isLinux() {
  return PlatformInfo.instance.isLinux();
}

bool isWindows() {
  return PlatformInfo.instance.isWindows();
}

bool isMobile() {
  return PlatformInfo.instance.isIos() || PlatformInfo.instance.isAndroid();
}

Future getPlatformInfo() async {
  return PlatformInfo.instance.getPlatformInfo();
}
