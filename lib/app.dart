import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackathon/provider/index.dart';
import 'package:hackathon/routes/index.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// @author: chenxiaoxi
/// @date: 2022/1/25
/// @description：app.dart
class HackathonApp extends StatefulWidget {
  const HackathonApp({Key? key}) : super(key: key);

  @override
  _HackathonAppState createState() => _HackathonAppState();
}

class _HackathonAppState extends State<HackathonApp> {
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
