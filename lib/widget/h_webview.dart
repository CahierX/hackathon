/// @author: chenxiaoxi
/// @date: 2022/1/27
/// @description：h_webview.dart
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';

class HWebview extends StatefulWidget {
  final String url;
  final Function? onFinish;

  const HWebview(this.url, {Key? key, this.onFinish}) : super(key: key);

  @override
  _HWebviewState createState() => _HWebviewState();
}

class _HWebviewState extends State<HWebview> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          // ignore: deprecated_member_use
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }

  int position = 1;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      return Container(
        child: IndexedStack(index: position, children: <Widget>[
          WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            onProgress: (int progress) {
              print(progress);
            },
            javascriptChannels: <JavascriptChannel>{
              _toasterJavascriptChannel(context),
            },
            navigationDelegate: (NavigationRequest request) {
              return NavigationDecision.navigate;
            },
            onPageStarted: (value) {
              setState(() {
                position = 1;
              });
            },
            onPageFinished: (value) {
              setState(() {
                position = 0;
              });
              if (widget.onFinish != null) {
                widget.onFinish!();
              }
            },
            gestureNavigationEnabled: true,
          ),
          const Center(child: CircularProgressIndicator()),
        ]),
      );
    });
  }
}
