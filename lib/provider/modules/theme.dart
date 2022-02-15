/// @author: chenxiaoxi
/// @date: 2022/1/25
/// @description：theme.dart
import 'package:flutter/foundation.dart';
class ThemeProvider with ChangeNotifier,DiagnosticableTreeMixin {
  int themeColor = 0;

  void setThemeData(int newData) {
    themeColor = newData;
    notifyListeners();

  }
}

