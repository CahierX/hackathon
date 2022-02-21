import 'package:flutter/services.dart';

/// @author: yangjie
/// @date: 2/20/22 10:52 PM
/// @description：video_player_plugin
///

class VideoPlayerPlugin {
  static const MethodChannel _channel =
      const MethodChannel("hackathon_video_player");

  static void play(String url) async {
    var map = Map();
    map["url"] = url;
    final res = await _channel.invokeMethod("play", map);
    print(res);
  }
}
