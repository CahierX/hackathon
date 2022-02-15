import 'package:desktop_webview_window/desktop_webview_window.dart';
import 'package:flutter/material.dart';
import 'dart:io';

/// @author: chenxiaoxi
/// @date: 2022/1/27
/// @description：play.dart
class MPlay extends StatefulWidget {
  const MPlay({Key? key}) : super(key: key);

  @override
  _MPlayState createState() => _MPlayState();
}

class _MPlayState extends State<MPlay> {
  late String url;
  @override
  Widget build(BuildContext context) {
    dynamic obj = ModalRoute.of(context)?.settings.arguments;
    if (obj != null) {
      url = obj["url"];
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('播放'),
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black54,
      ),
      body: RaisedButton(
        onPressed: () async {
          final webview = await WebviewWindow.create(
            configuration: CreateConfiguration(
              windowHeight: 1280,
              windowWidth: 720,
              title: "播放",
              titleBarTopPadding: Platform.isMacOS ? 20 : 0,
            ),
          );
          webview
            ..registerJavaScriptMessageHandler("test", (name, body) {
              debugPrint('on javaScipt message: $name $body');
            })
            ..launch(url);
        },
        child: Text('Show Flutter homepage'),
      ),
    );
  }
}
