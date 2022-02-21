/*
 * @Description: 
 * @Author: chenebenzheng
 * @Date: 2022-02-15 11:20:07
 * @LastEditTime: 2022-02-21 15:17:43
 * @LastEditors: chenebenzheng
 * @Reference: 
 */
import 'package:desktop_webview_window/desktop_webview_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackathon/themes/colors.dart';
import 'package:hackathon/utils/platform/index.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'app.dart';
import 'config/config.dart';
import 'config/global.dart';

const debug = true;

void main(List<String> args) =>
    Global.init(Config.packageEnvDevelopment).then((e) async {
      if (runWebViewTitleBarWidget(args)) {
        return;
      }
      WidgetsFlutterBinding.ensureInitialized();
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
          .then((_) {
        runApp(const HackathonApp());
        doWhenWindowReady(() {
          final win = appWindow;
          const initialSize = Size(920, 720);
          win.minSize = initialSize;
          win.size = initialSize;
          win.alignment = Alignment.center;
          win.title = "How to use system tray with Flutter";
          win.show();
        });
      });

      SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
        statusBarColor: Palette.backgroundWhite,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      );
      if (isAndroid()) {
        // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
        // SystemUiOverlayStyle systemUiOverlayStyle =
        //     const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
        SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
      } else if (isIos()) {
        SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
      }
    });
