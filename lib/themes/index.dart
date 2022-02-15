/// @author: chenxiaoxi
/// @date: 2021/10/11
/// @description：theme.config.dart
import 'package:flutter/material.dart';

import 'colors.dart';

/// 自定义移动端主题
ThemeData appThemeData() {
  return ThemeData(
      primarySwatch: Palette.ztaLight
  );
}

TextTheme _textThemeDefault() {
  return const TextTheme(
    bodyText2: TextStyle(fontSize: 14.0),
  );
}
//
// Map<int, Color> color =
// {
//   50:Color.fromRGBO(4,131,184, .1),
//   100:Color.fromRGBO(4,131,184, .2),
//   200:Color.fromRGBO(4,131,184, .3),
//   300:Color.fromRGBO(4,131,184, .4),
//   400:Color.fromRGBO(4,131,184, .5),
//   500:Color.fromRGBO(4,131,184, .6),
//   600:Color.fromRGBO(4,131,184, .7),
//   700:Color.fromRGBO(4,131,184, .8),
//   800:Color.fromRGBO(4,131,184, .9),
//   900:Color.fromRGBO(4,131,184, 1),
// };