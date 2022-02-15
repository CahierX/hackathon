/// @author: chenxiaoxi
/// @date: 2022/1/25
/// @description：colors.dart
import 'package:flutter/material.dart';

/// 自定义调色板
class Palette {
  /// 主色调
  static const MaterialColor ztaLight = MaterialColor(
    0xFF3D66F5,
    <int, Color>{
      50: Color(0xFFE1E5F3), // 10%
      100: Color(0xFFCFD7F4), // 20%
      200: Color(0xFFBCC9F5), // 30%
      300: Color(0xFFAABBF5), // 40%
      400: Color(0xFF98ACF5), // 50%
      500: Color(0xFF869EF6), // 60%
      600: Color(0xFF7490F7), // 70%
      700: Color(0xFF6182F7), // 80%
      800: Color(0xFF4F74F7), // 90%
      900: Color(0xFF3D66F8), // 100%
    },
  );

  /// 主背景色 浅灰
  static const Color backgroundGray = Color(0xffececec);

  /// 主题背景色 浅白
  static const Color backgroundWhite = Color(0xfff3f3f4);

  /// 主题字体深色颜色
  static const Color textPrimaryDark = Color(0xff293443);

  /// 普通深色文字颜色
  static const Color textNormalDark = Color(0xff162D4D);

  /// 主题字体浅色颜色
  static const Color textPrimaryWhite = Color(0xffffffff);
}
