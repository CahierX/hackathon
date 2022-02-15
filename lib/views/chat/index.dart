import 'package:flutter/material.dart';

/// @author: chenxiaoxi
/// @date: 2022/1/26
/// @description：index.dart
class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("chat"),
    );
  }
}
