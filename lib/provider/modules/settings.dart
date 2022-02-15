import 'package:flutter/foundation.dart';

/// @author: chenxiaoxi
/// @date: 2022/1/26
/// @description：settings.dart
///
class SettingsProvider with ChangeNotifier, DiagnosticableTreeMixin {
  int tabIndex = 0;

  void setTabIndexFunc(int inx) {
    tabIndex = inx;
    notifyListeners();
  }
}
