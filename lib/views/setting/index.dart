import 'package:flutter/material.dart';

/// @author: chenxiaoxi
/// @date: 2022/1/26
/// @description：index.dart
class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Setting'),
    );
  }
}
