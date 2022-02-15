/// @author: chenxiaoxi
/// @date: 2021/9/29
/// @description：index.dart 导出所有的Provider模块，命名空间
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'modules/settings.dart';
import 'modules/theme.dart';

List<SingleChildWidget> Store = [
  ChangeNotifierProvider(create: (_) => ThemeProvider()),
  ChangeNotifierProvider(create: (_) => SettingsProvider()),
];
