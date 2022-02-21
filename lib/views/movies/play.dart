import 'package:desktop_webview_window/desktop_webview_window.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/views/movies/video_player_plugin.dart';
import 'package:video_player/video_player.dart';
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
  late VideoPlayerController _controller;
  late String url;
  @override
  void initState() {
    super.initState();
    //http://mirror.aarnet.edu.au/pub/TED-talks/911Mothers_2010W-480p.mp4
    //http://192.168.1.41:27018/resource/vod/%E8%A6%81%E5%81%9A%E4%B8%80%E4%B8%AA%E7%A7%AF%E6%9E%81%E5%90%91%E4%B8%8A%E7%9A%84%E4%BA%BA.mp4
    _controller = VideoPlayerController.network(
        'http://192.168.1.41:27018/resource/vod/%E8%A6%81%E5%81%9A%E4%B8%80%E4%B8%AA%E7%A7%AF%E6%9E%81%E5%90%91%E4%B8%8A%E7%9A%84%E4%BA%BA.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    // _controller = VideoPlayerController.network(
    //     'http://mirror.aarnet.edu.au/pub/TED-talks/911Mothers_2010W-480p.mp4')
    //   ..initialize().then((_) {
    //     // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    //     setState(() {});
    //   });
  }
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
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
            : Container(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // setState(() {
          //   _controller.value.isPlaying
          //       ? _controller.pause()
          //       : _controller.play();
          // });

          VideoPlayerPlugin.play("http://mirror.aarnet.edu.au/pub/TED-talks/911Mothers_2010W-480p.mp4");
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
// RaisedButton(
// onPressed: () async {
// final webview = await WebviewWindow.create(
// configuration: CreateConfiguration(
// windowHeight: 1280,
// windowWidth: 720,
// title: "播放",
// titleBarTopPadding: Platform.isMacOS ? 20 : 0,
// ),
// );
// webview
// ..registerJavaScriptMessageHandler("test", (name, body) {
// debugPrint('on javaScipt message: $name $body');
// })
// ..launch(url);
// },
// child: Text('Show Flutter homepage'),
// )