/// @author: chenxiaoxi
/// @date: 2022/1/25
/// @description：global.dart
import 'package:flutter/material.dart';
import 'package:hackathon/utils/platform/index.dart';

import 'config.dart';

class Global {
  // 是否为release版
  static bool get isRelease => const bool.fromEnvironment("dart.vm.product");

  //初始化全局信息，会在APP启动时执行
  static Future init(env) async {
    //初始化国际化
    WidgetsFlutterBinding.ensureInitialized();
    print("env" + env);
    Config.setConfig(env);
    await PlatformInfo.instance.initPlatformState();
  }
}
