import 'package:flutter/material.dart';
import 'package:peemoti/application/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyMusic extends StatefulWidget {
  const MyMusic({super.key});

  @override
  State<MyMusic> createState() => _MyMusicState();
}

class _MyMusicState extends State<MyMusic> {
  late final WebViewController _controller;
  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..loadRequest(Uri.parse(AppConstants.musicUrl));
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 3 / 4, child: WebViewWidget(controller: _controller));
  }
}
