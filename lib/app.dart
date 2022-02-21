import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackathon/provider/index.dart';
import 'package:hackathon/routes/index.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:async';
import 'dart:io';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:system_tray/system_tray.dart';

/// @author: chenxiaoxi
/// @date: 2022/1/25
/// @description：app.dart
class HackathonApp extends StatefulWidget {
  const HackathonApp({Key? key}) : super(key: key);

  @override
  _HackathonAppState createState() => _HackathonAppState();
}

class _HackathonAppState extends State<HackathonApp> {
  final SystemTray _systemTray = SystemTray();
  final AppWindow _appWindow = AppWindow();

  Future<void> initSystemTray() async {
    String path = Platform.isWindows
        ? 'assets/tray/app_icon.ico'
        : 'assets/tray/app_icon.png';

    final menu = [
      MenuItem(label: 'Show', onClicked: _appWindow.show),
      MenuItem(label: 'Hide', onClicked: _appWindow.hide),
      MenuItem(label: 'Exit', onClicked: _appWindow.close),
    ];

    // We first init the systray menu and then add the menu entries
    await _systemTray.initSystemTray(
      title: "system tray",
      iconPath: path,
    );

    await _systemTray.setContextMenu(menu);

    // handle system tray event
    _systemTray.registerSystemTrayEventHandler((eventName) {
      debugPrint("eventName: $eventName");
      if (eventName == "leftMouseDown") {
      } else if (eventName == "leftMouseUp") {
        _systemTray.popUpContextMenu();
      } else if (eventName == "rightMouseDown") {
      } else if (eventName == "rightMouseUp") {
        _appWindow.show();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    initSystemTray();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: Store,
        child: ScreenUtilInit(
            //设计稿尺寸
            designSize: const Size(750, 1334),
            builder: () => MaterialApp(
                  debugShowCheckedModeBanner: false,
                  onGenerateTitle: (BuildContext context) =>
                      AppLocalizations.of(context)!.title,
                  // theme: appThemeData(),
                  routes: routes,
                  initialRoute: '/',
                  onGenerateRoute: getRouteFunction(),
                  localeResolutionCallback: (
                    Locale? locale,
                    Iterable<Locale> supportedLocales,
                  ) {
                    return const Locale('zh');
                  },
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: const <Locale>[
                    Locale('zh', ''), // 中文, no country code
                    Locale('en', ''), // English, no country code
                  ],
                )));
  }
}
