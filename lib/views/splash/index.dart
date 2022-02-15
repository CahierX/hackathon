import 'package:flutter/cupertino.dart';

/// @author: chenxiaoxi
/// @date: 2022/1/25
/// @description：index.dart
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("Splash"),
    );
  }
}
